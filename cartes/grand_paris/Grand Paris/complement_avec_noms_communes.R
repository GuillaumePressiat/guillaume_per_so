v<- cbind(as.data.frame(gCentroid(com, byid=T)),i=com@data$INSEE_COM)
v<-right_join(v,b %>% distinct(id) %>% select(id,Nom_de_la_commune),by=c('i'='id'))


ggplot() + geom_polygon(data=b,aes(long,lat,group=group,fill=Territoire),col='grey10',lwd=0.1) + 
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey10',lwd=1.5) +
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey50',lwd=1)+
  scale_fill_manual(name = "",values = myColors, labels=lab, guide = guide_legend(title.position = NULL)) + 
  geom_text(data=u,aes(x=x,y=y,label=row.names(u)),size=7,col='black')+
  geom_text(data=v,aes(x=x,y=y,label=Nom_de_la_commune),size=1,col='black')+
  coord_fixed() + ggtitle("Les 12 territoires du Grand Paris")+
  theme_opts + theme(legend.position="top")

require('ggrepel')
theme_opts <- list(theme(panel.grid.minor = element_blank(),
                         panel.grid.major = element_blank(),
                         panel.background = element_blank(),
                         plot.background = element_rect(fill="white"),
                         panel.border = element_blank(),
                         axis.line = element_blank(),
                         axis.text.x = element_blank(),
                         axis.text.y = element_blank(),
                         axis.ticks = element_blank(),
                         axis.title.x = element_blank(),
                         axis.title.y = element_blank(),
                         plot.title = element_text(size=28),
                         legend.text=element_text(size=8),
                         legend.title=element_text(size=20)))

ggplot() + geom_polygon(data=b,aes(long,lat,group=group,fill=Territoire),col='grey10',lwd=0.1) + 
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey10',lwd=1.5) +
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey50',lwd=1)+
  scale_fill_manual(name = "",values = myColors, labels=lab, guide = guide_legend(title.position = NULL)) + 
  geom_label_repel(data=u,
    aes(x, y, label = rownames(u)),
    fontface = 'bold', color = 'white',
    box.padding = unit(0.25, "lines"),fill='grey20',alpha=0.5,size=7,segment.size = 0,
    segment.color = NA
  ) +
  geom_text(data=v,
                   aes(x, y, label = Nom_de_la_commune),
                   fontface = 'bold', color = 'grey10',
                   #label.padding=unit(0.1, "lines"),fill=NA,
                   #box.padding = unit(0.25, "lines"),
                    alpha=0.7,size=0.8
                   # segment.size = 0,
                   # segment.color = NA
  )+
  #geom_text(data=v,aes(x=x,y=y,label=Nom_de_la_commune),size=1,col='black')+
  coord_fixed() + ggtitle("Les 12 territoires du Grand Paris")+
  theme_opts + theme(legend.position="top")


comp<-fortify(com,region="INSEE_COM")
comp<-anti_join(comp,b, by=c('id'='id'))

# replacer ile saint denis
v[v$i=='93039',]$y<-v[v$i=='93039',]$y-400
v[v$i=='93039',]$x<-v[v$i=='93039',]$x+600

# 650661.3
# 6871030

u <- as.data.frame(gCentroid(d2, byid=T))

lab<-c('T1 Paris', 'T2 Sud Hauts-de-Seine','T3 GPSO',
       'T4 La Défense','T5 Boucle Nord 92','T6 Plaine Commune','T7 Territoire des aéroports',
       'T8 Est Ensemble','T9 Grand-Paris Est','T10 ACTEP','T11 Plaine Centrale - Haut Val-de-Marne - Plateau Briand',
       'T12 Val de Bièvres - Seine Amont - Grand Orly')
names(myColors) <- levels(deux$Territoire)

u[rownames(u)=='T4',]<- c(u[rownames(u)=='T4',]$x-400,u[rownames(u)=='T4',]$y+1000)
u[rownames(u)=='T2',]<- c(u[rownames(u)=='T2',]$x,u[rownames(u)=='T2',]$y-800)
u[rownames(u)=='T8',]<- c(u[rownames(u)=='T8',]$x,u[rownames(u)=='T8',]$y+200)
u[rownames(u)=='T7',]<- c(u[rownames(u)=='T7',]$x-600,u[rownames(u)=='T7',]$y-600)
u[rownames(u)=='T6',]<- c(u[rownames(u)=='T6',]$x,u[rownames(u)=='T6',]$y+300)

theme_opts <- list(theme(panel.grid.minor = element_blank(),
                         panel.grid.major = element_blank(),
                         panel.background =  element_blank(),
                         plot.background = element_rect(fill = "grey95"),
                         legend.background = element_rect(fill = NA),
                         #panel.border = element_blank(),
                         panel.border = element_rect(colour = "black", fill=NA, size=2),
                         axis.line = element_blank(),
                         axis.text.x = element_blank(),
                         axis.text.y = element_blank(),
                         axis.ticks = element_blank(),
                         axis.title.x = element_blank(),
                         axis.title.y = element_blank(),
                         plot.title = element_text(size=28),
                         legend.text=element_text(face="bold", size=8),
                         legend.title=element_text(size=20),
                         legend.position = c(0.23, .25)))

ggplot() + 
  geom_polygon(data=comp,aes(long,lat,group=group),fill='grey95',alpha=0.8,col='grey70')  +
  geom_polygon(data=b,aes(long,lat,group=group,fill=Territoire),col='grey10',lwd=0.1) + 
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey10',lwd=0.9) +
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey50',lwd=0.6)+
  scale_fill_manual(name = "Grand Paris\n12 territoires",values = myColors, labels=lab) +
                    #guide = guide_legend(title.position = NULL)) + 

  coord_fixed(xlim=c(min(b$long)-13000,max(b$long)+200),
              ylim=c(min(b$lat)-200,max(b$lat)+200)) + 
  theme_opts + # theme(legend.position="left") + 
  geom_text(data=v,
            aes(x, y, label = Nom_de_la_commune),
            fontface = 'bold', color = 'grey10',
            #label.padding=unit(0.1, "lines"),fill=NA,
            #box.padding = unit(0.25, "lines"),
            alpha=0.7,size=0.8
            # segment.size = 0,
            # segment.color = NA
  )+
  geom_label_repel(data=u,
                   aes(x, y, label = rownames(u)),
                   fontface = 'bold', color = 'white',
                   box.padding = unit(0, "lines"),fill='black',alpha=1,size=4,segment.size = 0,
                   segment.color = NA,force=1
  ) +
  geom_text(aes(x=max(b$long)-4000,y=min(b$lat)),label="SIMAP / DOMU / AP-HP",fontface="bold")

