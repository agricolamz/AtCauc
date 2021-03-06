library(leaflet)
setwd("/home/agricolamz/_DATA/OneDrive1/_Work/Atlas.of.Caucasian.Languages/Dagestanian.atlas/affective")
dag <- read.csv("dag_affective.csv")
write.csv(dag, "dag_affective.csv", row.names = F)
palforlang <- colorFactor(c("#53FA05", # Agul
                            "#940000", # Akhvakh
                            "#823F08", # Andi
                            "#2FA80A", # Archi
                            "#E6B66E", # Bagvalal
                            "#5509D9", # Bezhta
                            "#B54E09", # Chamalal
                            "#EAFF00",  # Usisha-Tsudakhar
                            "#C2C200", # Gapshima
                            "#FFF700", # Mehweb
                            "#FFF700", # North-Dargwa
                            "#FF4D00", # Godoberi
                            "#E88300", # Karata
                            "tan", # Kumyk
                            "#12E667", # Lezgian
                            "#FFC400", # Muirin
                            "sienna3", # Nogai
                            "#99E600", # Tsakhur
                            "tomato", # Chechen
                            "#0099D6", # Tsez
                            "#0AF7D3", # Hunzib
                            "#EDE134", # Sanzhi-Itsari
                            "#006FFF", # Khvarshi
                            "#E000E0" # Lak
                            ), domain = dag$language)
palforfeature <- colorFactor(c("black", "white"), domain = dag$affective)
dagplot <- leaflet(dag) %>%
  addTiles() %>%
  addCircleMarkers(lng=dag$longitude,
             lat=dag$latitude, 
             popup=dag$language, 
             radius = 11,
             stroke = F,
             fillOpacity = 1, 
             color = "black") %>%
  addCircleMarkers(lng=dag$longitude,
                   lat=dag$latitude, 
                   popup=dag$language, 
                   stroke = F,
                   radius = 9.5,
                   fillOpacity = 1, 
                   color = palforfeature(dag$affective),
                   group = dag$affective) %>%
  addCircleMarkers(lng=dag$longitude,
                   lat=dag$latitude, 
                   popup=dag$language, 
                   stroke = F, 
                   radius = 5, 
                   fillOpacity = 0.6, 
                   color = palforlang(dag$language), 
                   group = dag$language) %>%
addLegend(title = "",
          position = c("bottomleft"),
          pal = palforlang,
          values = dag$language,
          opacity = 0.9)%>%
addLegend(title = "",
          position = c("bottomleft"),
          pal = palforfeature,
          values = dag$affective,
          opacity = 0.9)
dagplot



