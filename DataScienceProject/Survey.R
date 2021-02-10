##Exploratory Data Analysis(EDA):
1. Do manual analyzation of your data set
2. Simplify the variable(Use short term)
3. Reference: help(“mpg’) to know more about the process
4. Import your dataset
5. Clean your dataset
6. Use str function to know about the list of variable and data type of each variables
7. If all your variables are character, please find a way to change datatype of each variable as you want (As actual)
8. Perform the numeric and graphical analyzation
    8.1. Mean, Median, Mode (Central tendency)
    8.2. Find variance and SD
    8.3. Range and Quantile
    8.4. Use Summary function to verify your answers
    8.5. Filter the random samples using pipe operator
    8.6. Try to understand the seed function
    8.7. If your dataset’s variables are quantitative, try to plot Histogram and Box plot, Dot plot, Density plot (Using ggplot)
    8.8. If your dataset’s variables are qualitative, try to plot Bar chart, Pie chart (Using ggplot)
Note: Please try to use pipe operator as much as you can

```{r}
library(dplyr)
library(magrittr)
library(ggplot2)
library(readxl)
```

#4.Import Dataset
```{r}
data <- read_excel("/Users/thonlynan/Documents/Academic/Semester VII/DataScience-Mr.Dinesh/Projects/kit_data_set.xlsx")
```

# 5.Clean the data by using is.na() to find missing value
```{r}
data[which(is.na(data))]
```

# 6.Use str() to know about the list of variable and data type of each variables
```{r}
str(data)
```

# 8.Perform the numeric and graphical analyzation
```{r}
# Assign Internship Rate variable to x for further use
x <- data$Happiness_of_Cur_Pro
```

# 8.1. Mean, Median, Mode (Central tendency)
```{r}
# mean() used to find the mean value of particular variable
mean(x)

# median() used to find the mean value of particular variable
median(x)


# Mode is the value that has highest number of occurrences in a set of data.
# Create the mode function because in R there is no mode() built-in function to find mode value.
# getmode() to find mode value
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}
getmode(x)

```

# 8.2. Find variance and SD
```{r}
# variance() used to find sample variance value
var(x)

# sd() used to find sample standard derivation value
sd(x)
```

# 8.3. Range and Quantile
```{r}
# range() used to find min and max value of variable
range(x)

# quantile() used to find quntile of variable
quantile(x)
```

# 8.4. Use Summary function to verify your answers
```{r}
# summary() used to verify min, lower quntile, median, mean, upper quntile, and max values
summary(x)
```

# 8.5. Filter the random samples using pipe operator
```{r}
# sample_n() will return the random sample from the dataset base on n number
random <- data %>% sample_n(10)
random
```

# 8.6. Try to understand the seed function
The set.seed() function sets the starting number used to generate a sequence of random numbers – it ensures that you get the same result if you start with that same seed each time you run the same process. For example, if I use the sample() function immediately after setting a seed, I will always get the same sample.
```{r}
set.seed(1)
sample(10)
```

# 8.7. If your dataset’s variables are quantitative, try to plot Histogram and Box plot, Dot plot, Density plot (Using ggplot)
Visualization
In this part, we will plot data base on Batch and Internship Rate. So this is the quantitative data.
Plotting graph using ggplot2 library:
- Histogram and
- Box plot
- Dot plot
- Density plot
```{r}
# Histogram plotting
hist <- data %>% ggplot(aes(Happiness_of_Cur_Pro)) +
  geom_histogram(color="gray", fill="lightblue") 

hist
```

```{r}
# Box plotting
box <- data %>% ggplot(aes(Batch, Happiness_of_Cur_Pro)) +
        geom_boxplot(fill = "lightblue", color = "gray") +
        theme_classic()
box
```

```{r}
# Dot plotting
dot <- data %>% ggplot(aes(Happiness_of_Cur_Pro, Batch)) + 
      geom_dotplot(binaxis='y', stackdir='center',  dotsize=0.1, binwidth=0.85)

dot
```

```{r}
# Density plotting
density <- data %>% ggplot(aes(x=Happiness_of_Cur_Pro))+
  geom_density(color="gray", fill="lightblue")

density
```

# 8.8. If your dataset’s variables are qualitative, try to plot Bar chart, Pie chart (Using ggplot)
In this part, we will plot data base on Batch and Current Preference. So this is the qualitative data.
Plotting graph using ggplot2 library:
- Bar chart
- Pie chart
```{r}
# Bar Chart Plotting
bar <- data %>% ggplot(aes(x = factor(Need_new_Pro))) +
  geom_bar(fill="lightblue")+
    xlab("New Project Need")+
  theme_minimal()
bar
```

```{r}
# Pie Chart Plotting
pie <- data %>% ggplot(aes(x = "", y = "", fill = Need_new_Pro)) + 
  geom_bar(stat = "identity") +
  coord_polar("y") +
  theme_void()
pie
```
