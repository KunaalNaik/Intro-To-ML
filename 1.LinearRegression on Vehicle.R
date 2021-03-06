# Read Data
vehicle <- read.csv("vehicle.csv", header = TRUE)

# Data Review and Data Preparation
vehicle$lh[vehicle$lh==0] <- mean(vehicle$lh) # lh=labourhours
mean(vehicle$lh)
vehicle$lh
vehicle$lc[vehicle$lc==0] <- mean(vehicle$lc) # lc=labourcost
mean(vehicle$lc)
vehicle$lc

# Data Partition
set.seed(2222)
ind <- sample(2, nrow(vehicle), 
              replace = TRUE,
              prob = c(0.7, 0.3))
training <- vehicle[ind==1,]
testing <- vehicle[ind==2,]

# Multiple Linear Regression 
model <- lm(lc~lh, data=training)
model
summary(model)
plot(lc~lh, training, col="blue",main="scatterPlot")
abline(model, col = "red")

# Model Diagnostics
par(mfrow=c(2,2))
plot(model)
vehicle[1620,]
#pairs(vehicle)
# Prediction
pred <- predict(model, testing)
predict(model, data.frame(lh=10))

