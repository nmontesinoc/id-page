library(sqldf)

primer<-read.csv(file='primeroutput',header=FALSE)
segon<-read.csv(file='segonoutput',header=FALSE)
tercer<-read.csv(file='terceroutput',header=FALSE)

sql <- "SELECT COUNT(tercer.V1) FROM tercer WHERE tercer.V1 NOT IN (SELECT primer.V1 FROM primer) AND tercer.V1 NOT IN (SELECT segon.V1 FROM segon)"
result <- sqldf(sql)

print("Nombre d'entrades a terceroutput que no si son a primeroutput ni a segonoutput")
print(result)