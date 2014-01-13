#!/usr/bin/RScript

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

electrodes <- read.csv("ecg-electrodes.csv",
    col.names=c("magic","leadoffP","leadoffN","GPIO1","GPIO2","GPIO3","GPIO4",
                "RA","LA","V1","V2","V3","V4","V5","V6"));

# num samples
N <- length(electrodes$RA);

electrodes = data.frame(electrodes, LL=1:N * 0);

I <- electrodes$LA - electrodes$RA
II <- electrodes$RA - electrodes$LL
III <- electrodes$LA - electrodes$LL
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

# sample rate (samples per second)
rate <- 250

# times
t <- (0:(N - 1)) / rate;


#
# filter the leads with a bandpass filter from 0.1 Hz to 40 Hz
#

# filter setup
highPass <- 0.4; # Hz
highPassWidth <- 0.1; # Hz
lowPass <- 40; # Hz
lowPassWidth <- 1; # Hz
# possible/valid fft frequencies
f <- (0:(N - 1)) / N * rate;
# windowing function (just the product of two sigmoid functions)
win <- function(freq) { 1 / ((1 + exp(-(freq - highPass) / highPassWidth)) * (1 + exp((freq - lowPass) / lowPassWidth))) };

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
X11()
par(mfcol=c(6,2),cex=0.1)
for (i in 1:dim(unfiltered_leads)[2]) {
    plot(t, filtered_leads[,i], type="l", lwd=2, xlim=c(8,11), ylim=c(-4e-3,4e-3))
}


