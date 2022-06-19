library(sqldf)

primer<-read.csv(file='primeroutput',header=FALSE)
segon<-read.csv(file='segonoutput',header=FALSE)
tercer<-read.csv(file='terceroutput',header=FALSE)
quart<-read.csv(file='quartoutput',header=FALSE)
cinque<-read.csv(file='cinqueoutput',header=FALSE)
sise<-read.csv(file='siseoutput',header=FALSE)
sete<-read.csv(file='seteoutput',header=FALSE)

sql <- "SELECT COUNT(sete.V1) FROM sete WHERE sete.V1 NOT IN (SELECT primer.V1 FROM primer) AND sete.V1 NOT IN (SELECT segon.V1 FROM segon) AND sete.V1 NOT IN (SELECT tercer.V1 FROM tercer) AND sete.V1 NOT IN (SELECT quart.V1 FROM quart) AND sete.V1 NOT IN (SELECT cinque.V1 FROM cinque) AND sete.V1 NOT IN (SELECT sise.V1 FROM sise)"
result <- sqldf(sql)

print("Nombre d'entrades a seteoutput que no hi son a primeroutput, segonoutput, terceroutput, quartoutput, cinqueoutput ni siseoutput")
print(result)