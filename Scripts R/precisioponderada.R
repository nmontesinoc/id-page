library(sqldf)
targets<-read.csv(file='targets.csv',header=FALSE)
targets$V2<-paste(targets$V2,".third",sep='')

resultatcerca <- read.csv(file='output',header=FALSE)

sqltargets <- "SELECT targets.V1, targets.V2 FROM targets WHERE targets.V2 IN (SELECT resultatcerca.V1 FROM resultatcerca)"
targets<-sqldf(sqltargets)

targets$V1 <- seq.int(nrow(targets))

N = (nrow(targets)*(nrow(targets)+1))/2

targets$V3 <- (nrow(targets)-targets$V1+1) / N

print(nrow(targets))
print(sum(targets$V3))

sql <- "SELECT SUM(targets.V3) FROM targets WHERE targets.V2 IN (SELECT resultatcerca.V1 FROM resultatcerca WHERE resultatcerca.V2 == 'OK')"

result <- sqldf(sql)

print("Percentatge de precisió ponderada")
print(result)