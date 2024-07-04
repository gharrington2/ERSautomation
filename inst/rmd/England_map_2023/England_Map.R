
# Script to create maps for the info graphic

library(tidyverse)
library(sf)
library(tmap)
library(scales)

source("Data scripts/Main_report_data.R")

# pull out LAs for Greater Manchester
greater_manchester <- RSdf %>% filter(Year == max(Year), organisation_name %in% c("Manchester","Stockport","Tameside","Oldham","Rochdale","Bury","Bolton", "Wigan","Salford","Trafford"))%>%
  select(organisation_id) %>% pull()

# pull out LAs for West Midlands Combined  Authority
west_midlands_ca <- RSdf %>% filter(Year == max(Year), organisation_name %in% c("Wolverhampton","Dudley","Walsall","Sandwell","Birmingham", "Solihull", "Coventry"))%>%
  select(organisation_id) %>% pull()

# Create column based on regions of interest (i.e. London, Manchester .....)
England$manchester <- case_when(England$LAD23CD %in% greater_manchester ~ "Manchester",
                                England$LAD23CD %in% west_midlands_ca ~ "West Midlands Combined Authority",
England$region_name == "London" ~ "London",
England$region_name != "London" ~ "Rest of England")



##############################
# England
##############################

England_map <- England %>%  #filter(manchester == "Rest of England")%>%
  tm_shape() +
  tm_fill("rough_tot", style = "cont", breaks = c(0,5,10,20,50,100,250),
          labels = c("0","5","10","20","50","100+",""),
          palette = c("#FFFFFF","#C6DBEF","#9ECAE1", "#6BAED6", "#4292C6", "#2171B5", "#084594"),
          title = "People") +
  tm_borders( lwd = 1, lty = "solid", alpha = 0.1)+
  #tm_text("name_rtot", size = 0.8,col = "black")+
  tm_style("col_blind")+
  #tm_facets(by = "manchester")+
  tm_layout(frame = FALSE, frame.lwd = NA, panel.label.bg.color = NA)


tmap_save(England_map, "Maps_2023/png/England_map.png", width=4961, height=3508, asp=0)
tmap_save(England_map, "Maps_2023/svg/England_map.svg", width=4961, height=3508, asp=0)

##############################
# ROE London, Manchester, WMCA
##############################

England_map_facet <- England %>%  #filter(manchester == "Rest of England")%>%
  tm_shape() +
  tm_fill("rough_tot", style = "cont", breaks = c(0,5,10,20,50,100,250),
          labels = c("0","5","10","20","50","100+",""),
          palette = c("#FFFFFF","#C6DBEF","#9ECAE1", "#6BAED6", "#4292C6", "#2171B5", "#084594"),
          title = "People") +
  tm_borders( lwd = 1, lty = "solid", alpha = 0.1)+
  #tm_text("name_rtot", size = 0.8,col = "black")+
  tm_style("col_blind")+
  tm_facets(by = "manchester")+
  tm_layout(frame = FALSE, frame.lwd = NA, panel.label.bg.color = NA)

tmap_save(England_map_facet, "Maps_2023/png/England_map_facet.png", width=4961, height=3508, asp=0)
tmap_save(England_map_facet, "Maps_2023/svg/England_map_facet.svg", width=4961, height=3508, asp=0)


##############################
# ROE
##############################

RestOfEngland <- England %>%  filter(manchester == "Rest of England")%>%
  tm_shape() +
  tm_fill("rough_tot", style = "cont", breaks = c(0,5,10,20,50,100,250),
          labels = c("0","5","10","20","50","100+",""),
          palette = c("#FFFFFF","#C6DBEF","#9ECAE1", "#6BAED6", "#4292C6", "#2171B5", "#084594"),
          title = "People") +
  tm_borders( lwd = 1, lty = "solid", alpha = 0.2)+
  #tm_text("name_rtot", size = 0.8,col = "black")+
  tm_style("col_blind")+
  #tm_facets(by = "manchester")+
  tm_layout(frame = FALSE, frame.lwd = NA, panel.label.bg.color = NA)

tmap_save(RestOfEngland, "Maps_2023/png/RestOfEngland.png", width=4961, height=3508, asp=0)
tmap_save(RestOfEngland, "Maps_2023/svg/RestOfEngland.svg", width=4961, height=3508, asp=0)



##############################
# London
##############################

London_map <- England %>%  filter(manchester == "London")%>%
  tm_shape() +
  tm_fill("rough_tot", style = "cont", breaks = c(0,5,10,20,50,100,250),
          labels = c("0","5","10","20","50","100+",""),
          palette = c("#FFFFFF","#C6DBEF","#9ECAE1", "#6BAED6", "#4292C6", "#2171B5", "#084594"),
          title = "People",
          legend.show = FALSE) +
  tm_borders( lwd = 1, lty = "solid", alpha = 0.2)+
  #tm_text("name_rtot", size = 0.8,col = "black")+
  tm_style("col_blind")+
  #tm_facets(by = "manchester")+
  tm_layout(frame = FALSE, frame.lwd = NA, panel.label.bg.color = NA)

tmap_save(London_map, "Maps_2023/png/London_map.png", width=2000, height=2000, asp=0)
tmap_save(London_map, "Maps_2023/svg/London_map.svg", width=2000, height=2000, asp=0)



##############################
# Manchester
##############################

Manchester_map <- England %>%  filter(manchester == "Manchester")%>%
  tm_shape() +
  tm_fill("rough_tot", style = "cont", breaks = c(0,5,10,20,50,100,250),
          labels = c("0","5","10","20","50","100+",""),
          palette = c("#FFFFFF","#C6DBEF","#9ECAE1", "#6BAED6", "#4292C6", "#2171B5", "#084594"),
          title = "People",
          legend.show = FALSE) +
  tm_borders( lwd = 1, lty = "solid", alpha = 0.2)+
  #tm_text("name_rtot", size = 0.8,col = "black")+
  tm_style("col_blind")+
  #tm_facets(by = "manchester")+
  tm_layout(frame = FALSE, frame.lwd = NA, panel.label.bg.color = NA)

tmap_save(Manchester_map, "Maps_2023/png/Manchester_map.png", width=2000, height=2000, asp=0)
tmap_save(Manchester_map, "Maps_2023/svg/Manchester_map.svg", width=2000, height=2000, asp=0)



##############################
# WMCA
##############################

wmca_map <- England %>%  filter(manchester == "West Midlands Combined Authority")%>%
  tm_shape() +
  tm_fill("rough_tot", style = "cont", breaks = c(0,5,10,20,50,100,250),
          labels = c("0","5","10","20","50","100+",""),
          palette = c("#FFFFFF","#C6DBEF","#9ECAE1", "#6BAED6", "#4292C6", "#2171B5", "#084594"),
          title = "People",
          legend.show = FALSE) +
  tm_borders( lwd = 1, lty = "solid", alpha = 0.2)+
  #tm_text("name_rtot", size = 0.8,col = "black")+
  tm_style("col_blind")+
  #tm_facets(by = "manchester")+
  tm_layout(frame = FALSE, frame.lwd = NA, panel.label.bg.color = NA)

tmap_save(wmca_map, "Maps_2023/png/wmca_map.png", width=2000, height=2000, asp=0)
tmap_save(wmca_map, "Maps_2023/svg/wmca_map.svg", width=2000, height=2000, asp=0)



