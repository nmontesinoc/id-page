library(sqldf)

primer<-read.csv(file='primeroutput',header=FALSE)
segon<-read.csv(file='segonoutput',header=FALSE)
tercer<-read.csv(file='terceroutput',header=FALSE)
quart<-read.csv(file='quartoutput',header=FALSE)

sql <- "SELECT COUNT(quart.V1) FROM quart WHERE quart.V1 NOT IN (SELECT primer.V1 FROM primer) AND quart.V1 NOT IN (SELECT segon.V1 FROM segon) AND quart.V1 NOT IN (SELECT tercer.V1 FROM tercer)"
result <- sqldf(sql)

print("Nombre d'entrades a quartoutput que no hi son a primeroutput, segonoutput ni terceroutput")
print(result)