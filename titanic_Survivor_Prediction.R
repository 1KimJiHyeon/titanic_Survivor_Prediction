library(rpart)
library(rpart.plot)

titanic = read.csv("titanic_clean.csv",header = TRUE, sep = ",")
str(titanic)

# train데이터, test데이터 생성
set.seed(100)
train_Index = sample(nrow(titanic),0.8*nrow(titanic))
train_data = titanic[train_Index,]
testData =titanic[-train_Index,]


# train데이터로 의사결정나무 생성

m=rpart(survived ~ pclass + sex + age + sibsp + parch + fare + embarked,
        data = train_data,method="class")

prp(m,type=4,extra=2,digits = 3)


#test데이터로 예측수행 

testing_data = predict(m,testData,type="class")
accuracy = ifelse(testing_data == testData$survived, TRUE, FALSE)
table(accuracy)

accuracy_num = 217/262
accuracy_num

# testdata 262개에서 217개 예측 성공했다는 것을 알 수 있다.
# 생성된 분류모델의 정확도는 0.8282443로 즉 82%이다.