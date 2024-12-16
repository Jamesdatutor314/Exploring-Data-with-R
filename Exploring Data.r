# Load the data
data <- data.frame(
  State = c("Florida", "Alabama", "California"),
  Zip_Code = c(32116, 35236, 94565),
  Family_Size = c(6, 5, 1),
  Annual_Income = c(13500, 800, 23000)
)

# Print the data
data

# Study times for men and women

men <- c(10, 30, 30, 30, 30, 40, 60, 60, 60, 70,
         90, 90, 120, 120, 150, 150, 180, 180, 200,
         200, 230, 240, 240, 300)

women <- c(60, 90, 120, 120, 150, 150, 150, 170, 180, 180,
           180, 180, 180, 200, 200, 240, 240, 240, 300, 360)

# Dot Plot
library(ggplot2)

df_men <- data.frame(study.time = men,
                     sex = "man")

df_women <- data.frame(study.time = women,
                       sex = "woman")

data_combined <- rbind(df_men, df_women)

# Dot plot visualization
ggplot(data_combined, aes(x = study.time, y = sex, color = sex)) +
  geom_point(position = position_jitter(height = 0.1), size = 2) +
  labs(title = "Dot Plot of Study Times for Men and Women", x = "Minutes", y = "Sex")

# 5 Stat Summary
library(dplyr)

data_combined %>%
    group_by(sex) %>%
    summarize(n = n(),
              mean = mean(study.time),
              min = min(study.time),
              q1 = quantile(study.time,.25),
              q2 = quantile(study.time,.50),
              q3 = quantile(study.time,.75),
              max = max(study.time))

# Histogram Width 
men.iqr <- 185-55
women.iqr <- 210-150

men.width <- ceiling( (2*men.iqr)/24 )
women.width <- ceiling( (2*women.iqr)/20 )

# Histogram Men
data_combined %>%
    filter(sex == "man") %>%
    ggplot(aes(study.time)) + 
    geom_histogram(bins = men.width,color="black",fill='blue') +
    labs(x="Minutes","Histogram of Men's Study Time") +
    theme_minimal()

# Histogram Men
data_combined %>%
    filter(sex == "woman") %>%
    ggplot(aes(study.time)) + 
    geom_histogram(bins = women.width,color="black",fill='pink') +
    labs(x="Minutes","Histogram of Women's Study Time") +
    theme_minimal()

# Data
data <- c(32, 31, 30, 33, 34, 32, 35, 40, 32, 30, 32, 31)
mean(data)

# Summary statistics
summary(data)
iqr <- IQR(data)

# Boxplot
df <- data.frame(values=data)
ggplot(df,aes(x=values)) +
geom_boxplot(fill='red') +
labs(title ="Boxplot of Data",x="Values") +
theme_minimal()

# Print IQR
cat("Interquartile Range (IQR):", iqr)

# Create table
hair_data <- matrix(c(26, 24, 10, 3, 20, 35, 12, 9), ncol = 4, byrow = TRUE)
colnames(hair_data) <- c("Brown", "Blond", "Black", "Ginger")
rownames(hair_data) <- c("Male", "Female")

hair_table <- as.table(hair_data)
print(hair_table)

# Marginal distributions
margin.table(hair_table, 1) # Gender
margin.table(hair_table, 2) # Hair color

# Conditional distribution for gender
prop.table(hair_table, 1)

# Conditional distribution for hair color
prop.table(hair_table, 2)





# Given data
mean <- 266
sd <- 16





data <- rnorm(1000,mean,sd)
hist(data)

# (a) Sketch omitted (use theory)
# (b) P(gestation < 36 weeks)
p_36 <- pnorm(36 * 7, mean, sd)

# (c) P(gestation > 39 weeks)
p_39 <- 1 - pnorm(39 * 7, mean, sd)

# (d) P(245 <= gestation <= 270)
p_range <- pnorm(270, mean, sd) - pnorm(245, mean, sd)

# (e) Top 5% of gestations
top_5 <- qnorm(0.95, mean, sd)

cat("P(<36 weeks):", p_36, "\n")
cat("P(>39 weeks):", p_39, "\n")
cat("P(245-270):", p_range, "\n")
cat("Top 5% gestation threshold:", top_5)


