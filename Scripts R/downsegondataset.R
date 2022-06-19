library(sqldf)

primer<-read.csv(file='primeroutput',header=FALSE)
segon<-read.csv(file='segonoutput',header=FALSE)

sql <- "SELECT COUNT(segon.V1) FROM segon WHERE segon.V1 NOT IN (SELECT primer.V1 FROM primer)"
result <- sqldf(sql)

print("Nombre d'entrades a segonoutput que no hi son a primeroutput")
print(result)