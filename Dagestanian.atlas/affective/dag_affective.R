setwd("/home/agricolamz/_DATA/OneDrive1/_Work/Atlas.of.Caucasian.Languages/Dagestanian.atlas/affective")

dag <- read.csv("megatablo.csv")
pal <- colorFactor(colors()[c(652, 588)], domain = dag$affective)

dagplot <- leaflet(dag) %>%
  addTiles() %>%
  addCircleMarkers(lng=dag$longitude,
                   lat=dag$latitude, 
                   popup=dag$language, 
                   stroke = T, 
                   radius = 6, 
                   fillOpacity = 0.9, 
                   color = pal(dag$affective), 
                   group = dag$language) %>%
addLegend(title = "",
          position = c("bottomleft"),
          pal = pal,
          values = dag$affective,
          opacity = 0.6)%>%
addLayersControl(overlayGroups = dag$language)
dagplot
