library(leaflet)
setwd("/home/agricolamz/_DATA/OneDrive1/_Work/Atlas.of.Caucasian.Languages/Dagestanian.atlas/affective")
dag <- read.csv("dag_affective.csv")
palforlang <- colorFactor(c("#53FA05", # Agul
                            "#940000", # Akhvakh
                            "#823F08", # Andi
                            "#2FA80A", # Archi
                            "#E6B66E", # Bagvalal
                            "#5509D9", # Bezhta
                            "#B54E09", # Chamalal
                            "#A7B8B6", # Chechen
                            "#C2C200", # Gapshiminskij
                            "#FF4D00", # Godoberinskij
                            "#0AF7D3", # Gunzibskij
                            "#E88300", # Karatinskij
                            "#006FFF", # Khvarshi
                            "red", # Kumykskij
                            "#E000E0", # Lak
                            "#12E667", # Lezgian
                            "#FFF700", # Mehweb
                            "red", # Muiri
                            "pink", # Nogajskij
                            "#FFF700", # North-Dargwa
                            "red", # Sanzhi-Itsari
                            "#99E600", # Tsakhur
                            "#0099D6", # Tsez
                            "red"  # Usisha-Tsudakhar
                            ), domain = dag$language)
palforfeature <- colorFactor(c("white", "black"), domain = dag$affective)
dagplot <- leaflet(dag) %>%
  addTiles() %>%
  addCircleMarkers(lng=dag$longitude,
              lat=dag$latitude, 
                   popup=dag$language, 
                   stroke = F, 
                   radius = 11, 
                   fillOpacity = 0.5, 
                   color = palforlang(dag$language), 
                   group = dag$language) %>%
  addCircleMarkers(lng=dag$longitude,
                   lat=dag$latitude, 
                   popup=dag$language, 
                   stroke = T, 
                   radius = 2, 
                   fillOpacity = 0.9, 
                   color = palforfeature(dag$affective),
                   group = dag$affective) %>%
addLegend(title = "",
          position = c("bottomleft"),
          pal = palforlang,
          values = dag$language,
          opacity = 0.4)%>%
addLegend(title = "",
          position = c("bottomleft"),
          pal = palforfeature,
          values = dag$affective,
          opacity = 0.4)%>%
addLayersControl(
  overlayGroups = dag$affective,
  options = layersControlOptions(collapsed = F))
dagplot


