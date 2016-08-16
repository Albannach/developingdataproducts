library(data.table)
pulseRate <- fread('http://www.statsci.org/data/oz/ms212.txt')
pulseRate$Diff = pulseRate[,Pulse2]-pulseRate[,Pulse1]
pulseRate$Gender = factor(pulseRate$Gender)
pulseRate$Smokes = factor(pulseRate$Smokes)
pulseRate$Alcohol = factor(pulseRate$Alcohol)
pulseRate$Exercise = factor(pulseRate$Exercise)
pulseRate$Ran = factor(pulseRate$Ran)