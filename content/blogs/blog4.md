---
categories:
- ""
- ""
date: "2021-09-31T22:42:51-05:00"
description: 
draft: false
image: pic07.jpg
keywords: ""
slug: aliquam
title: Where do people drink the most?
---

Back in 2014, [fivethiryeight.com](https://fivethirtyeight.com/features/dear-mona-followup-where-do-people-drink-the-most-beer-wine-and-spirits/) published an article on alchohol consumption in different countries. The data `drinks` is available as part of the `fivethirtyeight` package. Make sure you have installed the `fivethirtyeight` package before proceeding.


```{r, load_alcohol_data}
library(fivethirtyeight)
data(drinks)


# or download directly
# alcohol_direct <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/alcohol-consumption/drinks.csv")

```


What are the variable types? Any missing values we should worry about? 

```{r glimpse_skim_data}
skimr::skim(drinks)

#We have one character and four numeric variables. We don't have any missing values.


```


Make a plot that shows the top 25 beer consuming countries

```{r beer_plot}
# YOUR CODE GOES HERE
drinks %>% 
  select(country, beer_servings)%>%
  slice_max(order_by=beer_servings, n=25) %>% 
  ggplot(aes(y=fct_reorder(country,beer_servings), x=beer_servings))+
  geom_col()+
  NULL

```

Make a plot that shows the top 25 wine consuming countries

```{r wine_plot}

# YOUR CODE GOES HERE
drinks %>% 
  select(country, wine_servings)%>%
  slice_max(order_by=wine_servings, n=25) %>% 
  ggplot(aes(y=fct_reorder(country,wine_servings), x=wine_servings))+
  geom_col()+
  NULL

```

Finally, make a plot that shows the top 25 spirit consuming countries
```{r spirit_plot}
# YOUR CODE GOES HERE

drinks %>% 
  select(country, spirit_servings)%>%
  slice_max(order_by=spirit_servings, n=25) %>% 
  ggplot(aes(y=fct_reorder(country,spirit_servings), x=spirit_servings))+
  geom_col()+
  NULL

```

What can you infer from these plots? Don't just explain what's in the graph, but speculate or tell a short story (1-2 paragraphs max).

> TYPE YOUR ANSWER AFTER (AND OUTSIDE!) THIS BLOCKQUOTE.

Looking at the graphs above, we can infer that different countries are specialised in production of different kinds of alcohol. Historically, countries strong in agriculture (Germany, Czech Republic, Poland) have higher beer production. Similarly, countries like France & Portugal have a favourable climate for wine production, which eventually becomes part of their culture.From a macroeconomic perspective, countries tend to specialise in what they are strong in, which we can observe in these graphs as well. In addition, poorer countries tend to consume stronger alcohol; we can observe Grenada, Belarus, Russia are the top 3 consumers of spirits.
