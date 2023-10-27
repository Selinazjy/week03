pacman::p_load(tidyverse)
glimpse(EMDAT)
df <- EMDAT %>% 
  select(Entity,Year,deaths_all_disasters,injured_all_disasters,homeless_all_disasters)%>%
  rename(DA=deaths_all_disasters, IA=injured_all_disasters,HA=homeless_all_disasters)
pacman::p_load(
  kableExtra,
  flextable
)

table_1 <- df %>% 
  group_by (Entity) %>%
  summarize(
    ave_DA = mean(DA) %>% round(2)) %>%
  dplyr::arrange(desc(ave_DA), Entity)

table_2 <- df %>%
  group_by (Entity) %>%
  summarize(
    ave_IA = mean (IA) %>% round(2)) %>%
  dplyr::arrange(desc(ave_IA),Entity)

table_3 <- df %>%
  group_by(Entity) %>%
  summarise(
    ave_HA = mean (HA) %>% round (2)) %>%
  dplyr::arrange(desc(ave_HA),Entity)

EMDAT$DA_more_than_500 <- ifelse( EMDAT$deaths_all_disasters > 500, "Yes", "Nah")

bb <-EMDAT %>%
  pivot_longer(
    cols = starts_with("deaths"),
    names_to = "death",
    values_to ="number"
  )


