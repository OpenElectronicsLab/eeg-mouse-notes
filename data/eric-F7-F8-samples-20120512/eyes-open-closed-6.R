o1 <- read.csv("open1.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
o2 <- read.csv("open2.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
o3 <- read.csv("open3.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
o4 <- read.csv("open4.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
o5 <- read.csv("open5.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
o6 <- read.csv("open6.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
c1 <- read.csv("closed1.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
c2 <- read.csv("closed2.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
c3 <- read.csv("closed3.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
c4 <- read.csv("closed4.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
c5 <- read.csv("closed5.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))
c6 <- read.csv("closed6.csv", col.names = c('magic', 'loffp', 'loffn', 'g1', 'g2', 'g3', 'g4', 'i1', 'i2', 'i3', 'i4', 'i5', 'i6', 'i7', 'i8'))

par(mfcol=c(6,2), mar=c(0,0,0,0))
plot(o1$i1, type='l', col='red', ylim=c(-0.028,-0.018))
plot(o2$i1, type='l', col='red', ylim=c(-0.028,-0.018))
plot(o3$i1, type='l', col='red', ylim=c(-0.028,-0.018))
plot(o4$i1, type='l', col='red', ylim=c(-0.028,-0.018))
plot(o5$i1, type='l', col='red', ylim=c(-0.028,-0.018))
plot(o6$i1, type='l', col='red', ylim=c(-0.028,-0.018))
plot(c1$i1, type='l', col='blue', ylim=c(-0.028,-0.018))
plot(c2$i1, type='l', col='blue', ylim=c(-0.028,-0.018))
plot(c3$i1, type='l', col='blue', ylim=c(-0.028,-0.018))
plot(c4$i1, type='l', col='blue', ylim=c(-0.028,-0.018))
plot(c5$i1, type='l', col='blue', ylim=c(-0.028,-0.018))
plot(c6$i1, type='l', col='blue', ylim=c(-0.028,-0.018))

