---
categories:
- ""
- ""
date: "2021-09-31T22:26:13-05:00"
description: 
draft: false
image: climate_change.jpg
keywords: ""
slug: tempus
title: Believing in Global Warming - does it depend on your political views? 
---

A 2010 Pew Research poll asked 1,306 Americans, “From what you’ve read and heard, is there solid evidence that the average temperature on earth has been getting warmer over the past few decades, or not?”

In this exercise, we analyze whether there are any differences between the proportion of people who believe the earth is getting warmer and their political ideology. As usual, from the survey sample data, we will use the proportions to estimate values of population parameters. The file has 2253 observations on the following 2 variables:

party_or_ideology: a factor (categorical) variable with levels Conservative Republican, Liberal Democrat, Mod/Cons Democrat, Mod/Lib Republican
response : whether the respondent believes the earth is warming or not, or Don’t know/ refuse to answer

Firstly, we load the file.

```{r, read_global_warming_pew_data}
global_warming_pew <- read_csv(here::here("data", "global_warming_pew.csv"))
```

We removed many responses which should not be taken into consideration, like "No Answer", "Don't Know", "Not applicable", "Refused to Answer".

```{r}
global_warming_pew %>% 
  count(party_or_ideology, response)
```

We constructed four 95% confidence intervals to estimate population parameters, for the percentage who believe that **Earth is warming**, according to their party or ideology.

```{r}
party_ci <- global_warming_pew %>% 
  filter(response != "Don't know / refuse to answer") %>%
  mutate(warm = response == "Earth is warming") %>% 
  group_by(party_or_ideology) %>% 
  summarise(mean_warm = mean(warm, na.rm = TRUE),
                         sd_warm = sd(warm, na.rm = TRUE),
                         count_warm = n(),
                         se_warm = sd_warm/sqrt(count_warm),
                         t_crit = qt(0.975, count_warm-1),
                         lower_ci = mean_warm - t_crit * se_warm,
                         upper_ci = mean_warm + t_crit * se_warm
            )
  
party_ci

```

Looking at the four confidence intervals, we can see that none of them overlap, suggesting that opinion on whether or not a respondent believes the earth is warming is dependent on political ideology. 
