# Please input your code here
sale_data <- read.csv("LaptopSales.csv", encoding = "UTF-8")
sale_data

# Please input your code here, same below
summary(sale_data)
#There are three variables have missing value, which are: OS.X.Store, OS.Y.Store, CustomerStoreDistance.
which(is.na(sale_data$OS.X.Store))
which(is.na(sale_data$OS.Y.Store))
which(is.na(sale_data$CustomerStoreDistance))


avg_price <- mean(sale_data$Retail.Price)
avg_price
median_price <- median(sale_data$Retail.Price)
median_price
#average price is 489.8,median price is 490

lap_IF <- subset(sale_data, Integrated.Wireless. == "Yes")
Avgp_lap_IF <- mean(lap_IF$Retail.Price)
Avgp_lap_IF
lap_NIF <- subset(sale_data, Integrated.Wireless. == "No")
Avgp_lap_NIF <- mean(lap_NIF$Retail.Price)
Avgp_lap_NIF
#the average price of a laptop with Integrated Wireless is 495.9, the average price of a laptop without Integrated Wireless is 483.3

lap_highest <- subset(sale_data, Retail.Price == "665")
lap_highest
#configuration 359 type has the highest price.


small_HD <- subset(sale_data, HD.Size..GB. < 150)
nrow(small_HD)
#there are 1749 laptops have HD size < 150

sum(sale_data$Retail.Price)
#total value of all laptops sold in this dataset is 1231470.

# your ggplot line here
 
 library(ggplot2)
 ggplot(data=sale_data, aes(x =CustomerStoreDistance , fill = ..count..)) + geom_histogram(alpha=1) + xlim(0,20000)
 + scale_fill_gradient(low="purple",high="darkblue") 
 + ggtitle("Customer Store Distance of Laptop Sales") + labs(x="Customer Store Distance", y="Count")
 #Insight: When customer store distance is approximately between 0 - 3000. The more customers stores increases 
 #within longer distance. But when distance is over approximately 3000, the longer the distance, the less 
 # customer stores. 

ggplot(data = sale_data, aes(x=, y=Retail.Price, color=)) +
  geom_boxplot(notch = FALSE, outlier.colour="orange", outlier.shape="triangle", outlier.size=3) +
  ggtitle("The Boxplot of Retail Price of the Laptop") +
  labs(y = "Retail Price of Laptop")
#Insights: 
#1.The mean of retail price of the laptop is less than 500.
#2.The lowest retail price of the laptop is about 300.
#3.The highest retail price of the laptop is over 650.
#4.The majority of retail price of the laptop is around 450 -550.


ggplot(data = sale_data, aes(x=HD.Size..GB., y=Retail.Price, group= HD.Size..GB., fill =HD.Size..GB.)) +
  geom_boxplot(notch = FALSE, outlier.colour="red", outlier.shape="triangle", outlier.size=3) +
  ggtitle("The Boxplot of Retail Price of the Laptop,by HD Size") +
  labs(x = "HD Size of the Laptop", y = "Retail Price of Laptop")
 #Insights:
 #1.HD size of the laptop can affect the retail price of the laptop.
 #2.When HD size of the laptop is smaller than 50, the average price of the laptop is the lowest.
 #3.When HD size of the laptop is greater than 50 but smaller than 150, the average price of laptop is higher a little than the laptop which has HD
 #size is smaller than 50. 
 #4.The laptop that its HD size is 300 has the highest retail price.

ggplot(data = sale_data, aes(x=Battery.Life..Hours., y=Retail.Price, color=Battery.Life..Hours.)) + geom_point(size=2)+
 ggtitle("The Relationship between Battery Life and Retail Price") + labs(x="Battery Life",y="Retail Price") +  geom_smooth(method=lm)
#Insights:
#1.There is a positive relationship between battery life and retail price of the laptop.
#2.

sale_data$Battery.Life..Hours.[sale_data$Battery.Life..Hours.==6] <- "High Quality"
sale_data$Battery.Life..Hours.[sale_data$Battery.Life..Hours.== 5 ] <- "Normal Quality"
sale_data$Battery.Life..Hours.[sale_data$Battery.Life..Hours.==4] <- "Low Quality"
ggplot(data = sale_data, aes(x=Retail.Price, fill=Battery.Life..Hours.)) + geom_histogram(alpha=0.8)+ 
ggtitle("Distribution of Retail Price by Battery Life") + labs(x="Retail Price",y="Count")
#Insights:
#1.There are three types of battery life, which can last 4,5,6 hours each.
#2.If the retail price of laptops are less than 450, battery life of laptops is more likely less than 6 hours, which means the low or normal quality.
#3.When the retail price of laptops are more than 450,the majority of laptops can have more than 5 hours battery of life.
#4.When the retail price of laptops are more than 600, the battery of life will last at least 6 hours.


