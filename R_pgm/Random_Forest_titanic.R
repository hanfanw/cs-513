#  Course          :  
#  First Name      : Khasha
#  Last Name       : Dehnad
#  Id              : 12345
#  purpose         :  

## Step 0 clean up!!!


rm(list=ls())

#install.packages('randomForest')
 
library(randomForest)
 
?randomForest()
?importance()
?tuneRF()
dsn<-
  read.csv("C://AIMS/Stevens_/CS513_datamining/Other/Titanic_rows.csv")

?read.csv()
set.seed(123)
dsn2<-na.omit(dsn)
set.seed(123)
?ifelse


index<-sort(sample(nrow(dsn2),round(.25*nrow(dsn2))))
training<-dsn2[-index,]
test<-dsn2[index,]

fit <- randomForest( Survived~., data=training, importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, test)
table(actual=test[,4],Prediction)


wrong<- (test[,4]!=Prediction )
error_rate<-sum(wrong)/length(wrong)
error_rate 

 
