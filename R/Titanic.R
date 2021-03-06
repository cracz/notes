options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

titanic %>% filter(!is.na(Age)) %>% 
  ggplot(aes(x=Age, fill=Sex)) +
  geom_density(alpha = 0.2)


params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))


titanic %>% filter(!is.na(Age)) %>% 
  ggplot(aes(sample=Age)) +
  geom_qq(dparams = params) + 
  geom_qq_line(dparams = params)



titanic %>% ggplot(aes(x = Survived, fill = Sex)) +
  geom_bar()


titanic %>% filter(!is.na(Age)) %>% 
  ggplot(aes(x=Age,  fill=Survived)) +
  geom_density(alpha = 0.2)



titanic %>% filter(Fare != 0) %>% 
  ggplot(aes(x = Survived, y=Fare)) +
  scale_y_continuous(trans="log2") +
  geom_boxplot()



titanic %>% ggplot(aes(x=Pclass, fill=Survived)) +
  geom_bar()

titanic %>% ggplot(aes(x=Pclass, fill=Survived)) +
  geom_bar(position = position_fill())

titanic %>% ggplot(aes(x=Survived, fill=Pclass)) +
  geom_bar(position = position_fill())



titanic %>% filter(!is.na(Age)) %>% 
  ggplot(aes(x=Age, y=..count.., fill=Survived)) +
  geom_density(alpha = 0.2) +
  facet_grid(Sex ~ Pclass)

