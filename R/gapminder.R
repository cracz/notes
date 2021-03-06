library(dslabs)
library(dplyr)
library(tidyverse)
data(gapminder)

gapminder %>% filter(year == 2015 & country %in% c("Turkey", "Sri Lanka", "Poland", "Malaysia", "Pakistan", "Thailand", "Russia", "South Korea", "Vietnam", "South Africa")) %>% 
  select(country, infant_mortality) %>%
  arrange(infant_mortality)

ds_theme_set()
years <- c(1962, 1980, 1990, 2000, 2012)
gapminder %>% filter(year %in% years) %>%
  ggplot(aes(fertility, life_expectancy, color = continent)) +
  geom_point() +
  facet_wrap(~year)

#Time series of fertility for two countries
countries <- c("South Korea", "Germany")
labels <- data.frame(country = countries, x = c(1970, 1965), y = c(6, 2.75))
gapminder %>% filter(country %in% countries) %>%
  ggplot(aes(year, fertility, color = country)) +
  geom_line() +
  geom_text(data = labels, aes(x, y, label = country), size = 5) +
  theme(legend.position = "none")

#Income in USD/day adjusted for inflation
gapminder <- gapminder %>% mutate(dollars_per_day = gdp/population/365)

past_year <- 1970
gapminder %>% filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(log2(dollars_per_day))) +
  geom_histogram(binwidth = 1, color = "black")

gapminder %>% filter(year == past_year & !is.na(gdp)) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2")

p <- gapminder %>% 
    filter(year == past_year & !is.na(gdp)) %>%
    mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
    ggplot(aes(region, dollars_per_day, fill = continent)) +
    geom_boxplot() + 
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    xlab("") + 
    scale_y_continuous(trans = "log2") +
    geom_point(show.legend = FALSE)

p

#Checking how the gap between Western and non-Western countries changes over time.
# The year 2010 has more countries and data than 1970 in this example.
west <- c("Western Europe", "Northern Europe", "Southern Europe", "Northern America", "Australia and New Zealand")
present_year <- 2010
gapminder %>%
  filter(year %in% c(past_year, present_year) & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ group)

#Now only looking at the same countries for each year.
country_list_1 <- gapminder %>% filter(year == past_year & !is.na(dollars_per_day)) %>%
  .$country

country_list_2 <- gapminder %>% filter(year == present_year & !is.na(dollars_per_day)) %>%
  .$country

country_list <- intersect(country_list_1, country_list_2)

gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list & !is.na(gdp)) %>%
  mutate(group = ifelse(region %in% west, "West", "Developing")) %>%
  ggplot(aes(dollars_per_day)) +
  geom_histogram(binwidth = 1, color = "black") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ group)

#Going back to previous boxplots, but this time comparing the two years.
q <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  mutate(region = reorder(region, dollars_per_day, FUN = median)) %>%
  ggplot() +
  geom_boxplot(aes(region, dollars_per_day, fill = factor(year))) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  xlab("") + 
  scale_y_continuous(trans = "log2")
  facet_grid(year ~ .)
  
q
  

r <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  mutate(group = ifelse(region%in%west, "West", "Developing")) %>%
  ggplot(aes(x = dollars_per_day, y = ..count.., fill = group)) +
  scale_x_continuous(trans = "log2")

r + geom_density(alpha = 0.2, bw = 0.75) + facet_grid(year ~ .)


#Make new groups of countries using case_when()
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "West",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region %in% c("Caribbean", "Central America", "South America") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    TRUE ~ "Others"))

#Turn those new groups into factors to control the order of levels
gapminder <- gapminder %>%
  mutate(group = factor(group, levels = c("Others", "Latin America", "East Asia", "Sub-Saharan Africa", "West")))

s <- gapminder %>%
  filter(year %in% c(past_year, present_year) & country %in% country_list) %>%
  ggplot(aes(x = dollars_per_day, y = ..count.., fill = group)) +
  scale_x_continuous(trans = "log2") +
  geom_density(alpha = 0.2, bw = 0.75, position = "stack") +
  facet_grid(year ~ .)

s



# Make more groups for a different study
gapminder <- gapminder %>%
  mutate(group = case_when(
    .$region %in% west ~ "The West",
    .$region %in% "Northern Africa" ~ "Northern Africa",
    .$region %in% c("Eastern Asia", "South-Eastern Asia") ~ "East Asia",
    .$region == "Southern Asia" ~ "Southern Asia",
    .$region %in% c("Central America", "South America", "Caribbean") ~ "Latin America",
    .$continent == "Africa" & .$region != "Northern Africa" ~ "Sub-Saharan Africa",
    .$region %in% c("Melanesia", "Micronesia", "Polynesia") ~ "Pacific Islands"))


# define a data frame with group average income and average infant survival rate
surv_income <- gapminder %>%
  filter(year %in% present_year & !is.na(gdp) & !is.na(infant_mortality) & !is.na(group)) %>%
  group_by(group) %>%
  summarize(income = sum(gdp)/sum(population)/365,
            infant_survival_rate = 1 - sum(infant_mortality/1000*population)/sum(population))
surv_income %>% arrange(income)

# plot average infant survival versus average income, with transformed axes
#The good relationship for the regional averages presents an ecological fallacy
#since the actual countries show much more variability than is suggested here.
surv_income %>% ggplot(aes(income, infant_survival_rate, label = group, color = group)) +
  scale_x_continuous(trans = "log2", limit = c(0.25, 150)) +
  scale_y_continuous(trans = "logit", limit = c(0.875, .9981),
                     breaks = c(.85, .90, .95, .99, .995, .998)) +
  geom_label(size = 3, show.legend = FALSE) 


