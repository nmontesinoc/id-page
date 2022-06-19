library(sqldf)

primer<-read.csv(file='primeroutput',header=FALSE)
segon<-read.csv(file='segonoutput',header=FALSE)
tercer<-read.csv(file='terceroutput',header=FALSE)
quart<-read.csv(file='quartoutput',header=FALSE)
cinque<-read.csv(file='cinqueoutput',header=FALSE)
sise<-read.csv(file='siseoutput',header=FALSE)

sql <- "SELECT COUNT(sise.V1) FROM sise WHERE sise.V1 NOT IN (SELECT primer.V1 FROM primer) AND sise.V1 NOT IN (SELECT segon.V1 FROM segon) AND sise.V1 NOT IN (SELECT tercer.V1 FROM tercer) AND sise.V1 NOT IN (SELECT quart.V1 FROM quart) AND sise.V1 NOT IN (SELECT cinque.V1 FROM cinque)"
result <- sqldf(sql)

print("Nombre d'entrades a siseoutput que no hi son a primeroutput, segonoutput, terceroutput, quartoutput ni cinqueoutput")
print(result)