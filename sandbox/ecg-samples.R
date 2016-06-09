#!/usr/bin/Rscript

# Electrode configuration:
# BIAS OUT: RL (green) - is connected to the Right Leg.
# IN1P: RA (white) - Right Arm.
# IN2P: LA (black) - Left Arm.
# IN3P: V1 (brown) - fourth intercostal, right strernal border.
# IN4P: V2 (yellow) - fourth intercostal, left sternal border.
# IN5P: V3 (green) - equal distance between V2 and V4.
# IN6P: V4 (blue) - fifth intercostal, left mid clavicular line.
# IN7P: V5 (orange) - anterior axillary line, same level with V4.
# IN8P: V6 (purple) - mid axillary line, same level with V4 and V5.
# IN1N .. IN8N: LL (red) - Left Leg (All negative inputs are tied together).

# sample rate (samples per second)
rate <- 500
samplefile <- "ecg-electrodes.csv";

#rate <- 250
#samplefile <- "../data/eric_12_lead_ecg_20160604T122800Z.csv";

electrodes <- read.csv(samplefile,
    col.names=c("magic","leadoffP","leadoffN","GPIO1","GPIO2","GPIO3","GPIO4",
                "RA","LA","V1","V2","V3","V4","V5","V6"));

# num samples
N <- length(electrodes$RA);

electrodes = data.frame(electrodes, LL=1:N * 0);

I <- electrodes$LA - electrodes$RA
II <- electrodes$LL - electrodes$RA
III <- electrodes$LL - electrodes$LA
aVR <- electrodes$RA - (electrodes$LA + electrodes$LL)/2
aVL <- electrodes$LA - (electrodes$RA + electrodes$LL)/2
aVF <- electrodes$LL - (electrodes$RA + electrodes$LA)/2
V1 <- electrodes$V1 - (electrodes$LA + electrodes$RA + electrodes$LL)/3
V2 <- electrodes$V2 - (electrodes$LA + electrodes$RA + electrodes$LL)/3
V3 <- electrodes$V3 - (electrodes$LA + electrodes$RA + electrodes$LL)/3
V4 <- electrodes$V4 - (electrodes$LA + electrodes$RA + electrodes$LL)/3
V5 <- electrodes$V5 - (electrodes$LA + electrodes$RA + electrodes$LL)/3
V6 <- electrodes$V6 - (electrodes$LA + electrodes$RA + electrodes$LL)/3

unfiltered_leads <- data.frame(I, II, III, aVR, aVL, aVF, V1, V2, V3, V4, V5, V6);


# times
t <- (0:(N - 1)) / rate;


#
# filter the leads with a bandpass filter from 0.1 Hz to 40 Hz
#

# filter setup
highPass <- 0.4; # Hz
highPassWidth <- 0.1; # Hz
lowPass <- 40; # Hz
lowPassWidth <- 4; # Hz
notch <- 60
notch_width <- 2
# possible/valid fft frequencies
f <- (0:(N - 1)) / N * rate;
# windowing function (just the product of two sigmoid functions)
win <- function(freq) {
    1 / (1 + exp(-(freq - highPass) / highPassWidth)) * # high pass
    1 / (1 + exp((freq - lowPass) / lowPassWidth)) * # low pass
    (1 - exp(-(((freq-notch)/notch_width)^2))) # notch
};

# apply the filter to each lead in turn
filtered_leads = unfiltered_leads
for (i in 1:dim(unfiltered_leads)[2]) {
    fft_unfiltered_lead = fft(unfiltered_leads[,i])
    fft_filtered_lead <- fft_unfiltered_lead * (win(f) + win(f[length(f)] - f));
    filtered_leads[,i] = Re(fft(fft_filtered_lead, inverse=TRUE) / N)
}

# plot the raw data
if (FALSE) {
    X11()
    par(mfcol=c(8,1),cex=0.1)
    for (i in (-8:-1 + dim(electrodes)[2])) {
        plot(t, electrodes[,i], type="l", lwd=2, xlim=c(1,11), ylim=c(-1./3, 1./3))
    }
}

# plot the processed data
if (FALSE) {
    X11()
    par(mfcol=c(6,2),cex=0.1)
    for (i in 1:dim(unfiltered_leads)[2]) {
        plot(t, filtered_leads[,i], type="l", lwd=2, xlim=c(8,11), ylim=c(-4e-3,4e-3))
    }
}

# plot the data on the standard grid
if (TRUE) {
    paper_speed_m_p_s <- 0.025
    gain_m_p_V <- 10.

    width_in <- 11
    height_in <- 8.5
    m_p_in <- 25.4e-3
    width_m <- width_in * m_p_in
    height_m <- height_in * m_p_in
    width_s <- width_m/paper_speed_m_p_s
    height_V <- height_m/gain_m_p_V

    rows = 3
    cols = 4

    offset_x_s <- 0.5
    offset_y_V <- 4e-3
    length_x_s <- 10.
    step_x_s <- length_x_s / cols
    step_y_V <- 3.5e-3
    step_x_samples <- step_x_s * rate
    start_time_samples <- step_x_samples * 2
    offset_label_V = 1e-3

    grid_size_x_s = 40e-3
    grid_size_y_V = 0.1e-3
    thick_line_every_n = 5
    thin_lwd=0.1
    thick_lwd=1

    pdf("ecg.pdf", width=width_in, height=height_in)
    plot.new()
    par(mar=c(0,0,0,0))
    plot.window(xlim=c(0,width_s), ylim=c(0, height_m/gain_m_p_V),
                xaxs="i", yaxs="i" # use the exact plot range specified
                )

    # draw the grid
    for (i in 0:floor(width_s / grid_size_x_s)) {
        abline(v=i * grid_size_x_s,
               lwd=(if (i %% thick_line_every_n == 0) thick_lwd else thin_lwd),
               col="red")
    }
    for (i in 0:floor(height_V / grid_size_y_V)) {
        abline(h=i * grid_size_y_V,
               lwd=(if (i %% thick_line_every_n == 0) thick_lwd else thin_lwd),
               col="red")
    }

    center_median <- function (x) { x - median(x) }

    plot_trace <- function (lead, samples, row, col) {
        zero_x <- step_x_s * (col - 1) + offset_x_s
        zero_y <- step_y_V * (row - 1) + offset_y_V
        lines(t[samples]  - t[samples[1]] + zero_x,
             center_median(filtered_leads[samples, lead]) + zero_y
             )
        text(zero_x,
             zero_y + offset_label_V,
             colnames(unfiltered_leads)[lead],
             pos=4)
    }

    #plot the main traces
    for (j in 0:(cols-1)) {
        for (i in 0:(rows-1)) {
            samples = 1:step_x_samples + step_x_samples * j + start_time_samples
            lead = 1 + i + j*rows
            plot_trace(lead, samples, 5-i, j+1)
        }
    }

    #plot the rhythm strips
    rhythm_leads <- c(2,7)
    samples = 1:(step_x_samples * cols) + start_time_samples
    for (i in 1:length(rhythm_leads)) {
        plot_trace(rhythm_leads[i], samples, 3-i, 1)
    }

    dev.off()
}

