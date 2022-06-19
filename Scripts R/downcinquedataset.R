library(sqldf)

primer<-read.csv(file='primeroutput',header=FALSE)
segon<-read.csv(file='segonoutput',header=FALSE)
tercer<-read.csv(file='terceroutput',header=FALSE)
quart<-read.csv(file='quartoutput',header=FALSE)
cinque<-read.csv(file='cinqueoutput',header=FALSE)

sql <- "SELECT COUNT(cinque.V1) FROM cinque WHERE cinque.V1 NOT IN (SELECT primer.V1 FROM primer) AND cinque.V1 NOT IN (SELECT segon.V1 FROM segon) AND cinque.V1 NOT IN (SELECT tercer.V1 FROM tercer) AND cinque.V1 NOT IN (SELECT quart.V1 FROM quart)"
result <- sqldf(sql)

print("Nombre d'entrades a cinqueoutput que no hi son a primeroutput, segonoutput, terceroutput ni quartoutput")
print(result)