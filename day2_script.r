https://swcarpentry.github.io/r-novice-gapminder/02-project-intro.html

a <- TRUE

# Supports multiple types
y <- list("banana",3, NA)

y

print(class(y[1]))
print(class(y[[1]]))

# Get info of a list
str(y)

#In R console install.packages("dplyr")
#library(dplyr)

#Named list
my_pet <- list(
    name = "Penelope",
    age = 2,
    likes = c("socks", "bark", "cuddles")
)

my_pet[[3]]
my_pet$likes
my_pet$likes[1]
my_pet[[3]][1]

# [] - gives back whatever format its already in
# [[]] - gives back whatever is stored at that location

pets <- list(
    name = c("Penny", "Thor", "Cosmos", "Lui"),
    type = c("Dog", "Dog", "Cat", "Dog"),
    notes = "pets collected in workshop",
    num_pets = 4
)

length(pets)
length(pets$name)

pets_df <- data.frame(
    name = c("Penny", "Thor", "Cosmos", "Lui"),
    type = c("Dog", "Dog", "Cat", "Dog")
)

pets_df

pets_df <- data.frame(
    name = c("Penny", "Thor", "Cosmos", "Lui"),
    type = c("Dog","Cat")
)

pets_df

pets_df[1]

dplyr::select(pets_df, name) # always works
select(pets_df, name) # only works if library(dplyr) is there, without any other to generate conflict with names
# this is not cool. Disadvantage

pets_df[1,]
class(pets_df[1,])

pets_df[1:2,]

new_pet <- data.frame(
    name = "George",
    type = "Fish"
)

new_pet <- data.frame(
    name = "George"
)

new_pet <- data.frame(
    name = "George",
    type = "Fish",
    likes = "Escape"
)

new_pet <- data.frame(
    name = "George",
    likes = "Escape"
)

dim(pets_df)
length(pets_df)

dim(new_pet)

# to add new entries: rbind and dplyr::bind_rows
rbind(pets_df,new_pet) # complains for not matching dimensions
dplyr::bind_rows(pets_df,new_pet) # add row and brute force it with NA

pets_df <- bind_rows(pets_df,new_pet)

pets_df

nrow(pets_df)
ncol(pets_df)
length(pets_df)

#working with gapminder.csv

getwd() #KEY
setwd()
list.files()

#Relative or absolute path
gapminder <- read.csv("/Users/bacalao/Desktop/gapminder_data.csv")

#downloads as dataframe
class(gapminder)

# USEFUL preview info of data
str(gapminder)

# getting help (just run it)
read.table
help(read.table)


gapminder$country
as.factor(gapminder$country)

choices <- factor(
    c("left", "right", "right", "middle", "left", "right"),
    levels = c("left", "right", "middle")
)

choices

choices <- factor(
    c("left", "right", "right", "middle", "left", "up"),
    levels = c("left", "right", "middle")
)

choices

choices <- factor(
    c("left", "right", "right", "middle", "left", "right"),
    levels = c("left", "left", "right", "middle")
)


#nested functions versus pipes
#pipes work with tidyverse
levels(as.factor(gapminder$country))
gapminder$country %>% as.factor() %>% levels()

table(gapminder$country)

#Returns string
levels(as.factor(gapminder$year))
length(levels(as.factor(gapminder$year)))

#Returns int
unique(gapminder$year)

#Summarize creates a dataframe
gapminder %>% 
summarize(
    n_countries = length(unique(country)),
    n_continents = length(unique(continent)),
    first_year = min(year),
    last_year = max(year)
)

gapminder %>% 
filter(continent == "Asia") %>% 
summarize(
    n_countries = length(unique(country)),
    n_continents = length(unique(continent)),
    first_year = min(year),
    last_year = max(year)
)

gapminder %>% 
filter(continent == "Asia" | continent == "Oceania") %>% 
summarize(
    n_countries = length(unique(country)),
    n_continents = length(unique(continent)),
    first_year = min(year),
    last_year = max(year)
)

gapminder %>% 
filter(continent %in% c("Americas", "Oceania")) %>% 
summarize(
    n_countries = length(unique(country)),
    n_continents = length(unique(continent)),
    first_year = min(year),
    last_year = max(year)
)

df <- data.frame(
    name = c("Jose", "Jse", "jose", "Alex", "Alexa"),
    weight = c(12,14,12,15,15)
)

df$clean_name <-NA
class(df$clean_name)
df$clean_name[df$name %in% c("Jose", "Jse", "jose")] <- "Jose"

df$clean_name[df$name %in% c("Alex", "Alexa")] <- "Alex"

gapminder %>% 
group_by(continent) %>% 
summarize(
    n_countries = length(unique(country)),
    n_continents = length(unique(continent)),
    first_year = min(year),
    last_year = max(year),
    avg_lifeExp = mean(lifeExp)
) %>%
as.data.frame()

continentstats <- gapminder %>% 
filter(continent != "Oceania") %>%
group_by(continent) %>% 
summarize(
    n_countries = length(unique(country)),
    n_continents = length(unique(continent)),
    first_year = min(year),
    last_year = max(year),
    avg_lifeExp = mean(lifeExp)
)

#Same but other way
gapminder %>% 
group_by(continent) %>% 
summarize(
    n_countries = length(unique(country)),
    n_continents = length(unique(continent)),
    first_year = min(year),
    last_year = max(year),
    avg_lifeExp = mean(lifeExp)
) %>%
as.data.frame() -> continent_stats

write.csv(continent_stats,"continent_stats.csv",row.names=FALSE)

#Filter to the countries of Americas
# and calculate avg GDP per capita, per country (e.g. group_by(country))
gapminder %>% 
group_by(country) %>% 
filter(continent == "Americas") %>%
summarize(
    avg_gdp = mean(gdpPercap)
) %>%
as.data.frame()

str(gapminder)

gapminder %>% 
filter(continent %in% c("Africa", "Asia", "Americas"))  %>%
group_by(continent,year) %>% 
summarize(
    n_countries = length(unique(country)),
    avg_lifeExp = mean(lifeExp)
) %>%
arrange(desc(year),desc(avg_lifeExp))%>%
as.data.frame()

getwd() #GET WORKING DIRECTORY
list.files() #LIST FILES IN DIRECTORY

# This is a new comment