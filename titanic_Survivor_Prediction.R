library(rpart)
library(rpart.plot)

titanic = read.csv("titanic_clean.csv",header = TRUE, sep = ",")
str(titanic)

# train������, test������ ����
set.seed(100)
train_Index = sample(nrow(titanic),0.8*nrow(titanic))
train_data = titanic[train_Index,]
testData =titanic[-train_Index,]


# train�����ͷ� �ǻ�������� ����

m=rpart(survived ~ pclass + sex + age + sibsp + parch + fare + embarked,
        data = train_data,method="class")

prp(m,type=4,extra=2,digits = 3)


#test�����ͷ� �������� 

testing_data = predict(m,testData,type="class")
accuracy = ifelse(testing_data == testData$survived, TRUE, FALSE)
table(accuracy)

accuracy_num = 217/262
accuracy_num

# testdata 262������ 217�� ���� �����ߴٴ� ���� �� �� �ִ�.
# ������ �з����� ��Ȯ���� 0.8282443�� �� 82%�̴�.