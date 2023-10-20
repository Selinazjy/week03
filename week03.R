pacman::p_load(tidyverse)
glimpse(EMDAT)
df <- EMDAT %>% 
  select(Entity,Year,deaths_all_disasters,injured_all_disasters,homeless_all_disasters)%>%
  rename(DA=deaths_all_disasters, IA=injured_all_disasters,HA=homeless_all_disasters)
