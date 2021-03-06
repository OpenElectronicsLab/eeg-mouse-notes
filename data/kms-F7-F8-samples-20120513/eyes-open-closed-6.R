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
plot(o1$i1, type='l', col='red', ylim=c(min(o1$i1),min(o1$i1)+0.001))
plot(o2$i1, type='l', col='red', ylim=c(min(o2$i1),min(o2$i1)+0.001))
plot(o3$i1, type='l', col='red', ylim=c(min(o3$i1),min(o3$i1)+0.001))
plot(o4$i1, type='l', col='red', ylim=c(min(o4$i1),min(o4$i1)+0.001))
plot(o5$i1, type='l', col='red', ylim=c(min(o5$i1),min(o5$i1)+0.001))
plot(o6$i1, type='l', col='red', ylim=c(min(o6$i1),min(o6$i1)+0.001))
plot(c1$i1, type='l', col='blue', ylim=c(min(c1$i1),min(c1$i1)+0.001))
plot(c2$i1, type='l', col='blue', ylim=c(min(c2$i1),min(c2$i1)+0.001))
plot(c3$i1, type='l', col='blue', ylim=c(min(c3$i1),min(c3$i1)+0.001))
plot(c4$i1, type='l', col='blue', ylim=c(min(c4$i1),min(c4$i1)+0.001))
plot(c5$i1, type='l', col='blue', ylim=c(min(c5$i1),min(c5$i1)+0.001))
plot(c6$i1, type='l', col='blue', ylim=c(min(c6$i1),min(c6$i1)+0.001))

