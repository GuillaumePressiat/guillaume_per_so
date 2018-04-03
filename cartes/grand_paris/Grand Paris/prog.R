libs <- c('rgdal','rgeos','classInt','RColorBrewer','maptools','readr', 'ggplot2', 'dplyr', 'plotly','reshape','reshape2','ggthemes', 'knitr', 'rmarkdown')
sapply(libs, require, character.only = TRUE)
# Grand paris
# a partir des communes et territoires ici :
# http://www.apur.org/sites/default/files/documents/etablissements_publics_territoriaux_MGP_carte_chiffres_cles.pdf

require(readr)
require(dplyr)
un<-read_delim('base_officielle_codes_postaux_-_09102015-2.csv', delim=';')
names(un)
View(un)
deux<- un %>% filter(substr(INSEE_COM,1,2) %in% c('75', '92', '93', '94') |
                       
                       INSEE_COM %in% c('95018', '91479', '91027','91326',
                                        '91589','91432','91687'))
# 95018 argenteuil
# 91479 paray vieille poste
# 91027 athis mons
# 91326 juvisy
# 91589 savigny
# 91432 morangis
# viry chatillon
deux$Territoire<-rep('000',nrow(deux))

T1<- (substr(deux$INSEE_COM,1,2)=='75')

T2<- (deux$INSEE_COM %in% c('92046','92049','92020','92007','92023','92032','92014','92071',
                            '92060','92019','92002'))
# malakoff
# montrouge
# chatillon
# bagneux
# clamart
# fontenay aux roses
# bourg la reine
# sceaux
# le plessis robinson
# chatenay malabry
# antony

T3<- (deux$INSEE_COM %in% c('92012','92040','92075','92072','92048','92022','92077','92047'))

# boulogne billancourt
# vanves
# sevres
# meudon
# chaville
# ville d'avray
# marnes la coquette 


T4<- (deux$INSEE_COM %in% c('92064','92033','92076','92063','92073','92050','92062','92051','92044',
                            '92026','92035'))

# saint cloud
# garches
# vaucresson
# rueil malmaison
# suresnes
# nanterre
# puteaux
# neuilly sur seine
# levallois perret
# courbevoie
# la garenne colombes

T5<- (deux$INSEE_COM %in% c('95018','92025','92009','92004','92024','92036','95018','92078'))

# argenteuil
# colombes
# bois colombes
# asnieres sur seine
# clichy
# gennevilliers
# argenteuil
# villeneuve la garenne

T6<- (deux$INSEE_COM %in% c('93031','93039','93070','93066','93079','93059','93072','93027',
                            '93001'))

# epinay sur seine
# ile st denis
# st ouen
# st denis
# villetaneuse
# pierrefitte sur seine
# stains
# la courneuve
# aubervilliers

T7<- (deux$INSEE_COM %in% c('93030','93013','93029','93007','93005','93071','93078','93073'))

# Dugny
# Le Bourget
# Drancy
# Le Blanc mesnil
# Aulnay sous bois
# Sevran
# Villepinte
# tremblay en france

T8<- (deux$INSEE_COM %in% c('93055','93008','93061','93045','93006','93048','93063','93053','93010'))

# pantin
# bobigny
# pre st gervais
# les lilas
# bagnolet
# montreuil
# romainville
# noisy le sec
# bondy

T9<- (deux$INSEE_COM %in% c('93064','93049','93077','93050','93051','93033',
                            '93032','93062','93047','93014','93057','93046','93015','93074'))


# rosny sous bois
# neuilly plaisance
# villemomble
# neuilly sur marne
# noisy le grand  
# gournay sur marne
# gagny
# le raincy
# montfermeil
# clichy sous bois
# les pavillons sous bois
# livry gargan
# coubron
# vaujours

T10<- (deux$INSEE_COM %in% c('94080','94033','94052','94042','94067','94058',
                             '94015','94079','94017','94068','94046','94069','94018'))

# vincennes
# fontenay sous bois
# nogent sur marne
# joinville le pont
# saint mande
# le perreux sur marne
# bry sur marne
# villiers sur marne
# champigny sur marne
# saint maur des fosses
# maisons alfort
# saint maurice
# charenton le pont

T11<- (deux$INSEE_COM %in% c('94002','94028','94011','94044','94004','94075','94047',
                             '94056','94070','94048',
                             '94071','94053','94055','94019','94059','94060'
                             ))

# Alfortville
# Creteil
# bonneuil sur marne
# limeil brevannes
# boissy st leger
# villecresnes
# mandres les roses
# perigny
# santeny
# marolles en brie
# sucy en brie
# noiseau
# ormesson sur marne
# chennevieres sur marne
# le plessis trevise
# la queue en brie
16

T12<- (deux$INSEE_COM %in% c( '91479', '91027','91326',
                             '91589','91432','91687',
                             '94037','94043','94041','94003',
                             '94016','94076','94081',
                             '94038','94021','94073','94022','94074','94078',
                             '94077','94054','94034','94065','94001'))


# 91479 paray vieille poste
# 91027 athis mons
# 91326 juvisy
# 91589 savigny
# 91432 morangis
# viry chatillon


# gentilly
# kremlin bicetre
# ivry sur seine
# arcueil
# cachan
# villejuif
# vitry sur seine
# l'hay les roses
# chevilly larue
# thiais
# choisy le roi
# valenton
# villeneuve st georges
# villeneuve le roi
# orly
# fresnes 
# rungis
# ablon sur seine
25 


deux[T1,]$Territoire<-"T1"
deux[T2,]$Territoire<-"T2"
deux[T3,]$Territoire<-"T3"
deux[T4,]$Territoire<-"T4"
deux[T5,]$Territoire<-"T5"
deux[T6,]$Territoire<-"T6"
deux[T7,]$Territoire<-"T7"
deux[T8,]$Territoire<-"T8"
deux[T9,]$Territoire<-"T9"
deux[T10,]$Territoire<-"T10"
deux[T11,]$Territoire<-"T11"
deux[T12,]$Territoire<-"T12"
sum(deux$Territoire!='000')/nrow(deux)
View(deux[deux$Territoire=='000',])

#write_csv(deux,"Grand Paris T.csv")

require(rgdal)
com<-readOGR(dsn='P:/Pressiat/Avec R/Faire une carte/Sources/package_rleafmap_modif_gpr','fdc2')
deux<-deux %>% distinct(INSEE_COM)
require(plyr)
require(rgeos)

myColors <- c("#3399ff","#6699ff","#66ccff","#99ffcc","#009933","#ccff66","#999966",
              "#ffff99","#666633","#33cccc","#9966ff","#99ff66")

deux$Territoire=factor(deux$Territoire,levels= c('T1','T2','T3','T4','T5','T6','T7','T8',
                                                 'T9','T10','T11','T12'))
names(myColors) <- levels(deux$Territoire)
colScale <- scale_colour_manual(name = "12 territoires",values = myColors)

b<-fortify(com,region="INSEE_COM")

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
                         legend.text=element_text(size=10),
                         legend.title=element_text(size=20)))

b<-inner_join(b,deux,by=c("id"="INSEE_COM"))
b$Territoire=factor(b$Territoire,levels= c('T1','T2','T3','T4','T5','T6','T7','T8',
                                                 'T9','T10','T11','T12'))

ggplot() + geom_polygon(data=b,aes(long,lat,group=group,fill=Territoire),col='grey10') + 
  scale_fill_manual(name = "12 territoires",values = myColors) + 
  coord_fixed() + 
  theme_opts


# a<-fortify(map2,region=="Territoire")
# ggplot() + geom_polygon(data=a,aes(long,lat, group=group))

# reunir par territoire
dd <- full_join(com@data, deux, "INSEE_COM"="INSEE_COM")
dd<-dd[!is.na(dd$Territoire),]

dd <- merge(com, deux, by="INSEE_COM")
dd<-dd[!is.na(dd@data$Territoire),]
d2<-unionSpatialPolygons(dd, dd$Territoire)
d2$Te<-unique(dd$Territoire)
d3<-fortify(d2,region="Te")

ggplot() + geom_polygon(data=b,aes(long,lat,group=group,fill=Territoire),col='grey10') + 
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey10',lwd=1.5) +
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey50',lwd=1)+
  scale_fill_manual(name = "",values = myColors, guide = guide_legend(title.position = NULL)) + 
  coord_fixed() + 
  theme_opts + theme(legend.position="top") + ggtitle("Les 12 territoires du Grand Paris")


u <- as.data.frame(gCentroid(d2, byid=T))

lab<-c('T1 Paris', 'T2 Sud Hauts-de-Seine','T3 GPSO',
       'T4 La Défense','T5 Boucle Nord 92','T6 Plaine Commune','T7 Territoire des aéroports',
       'T8 Est Ensemble','T9 Grand-Paris Est','T10 ACTEP','T11 Plaine Centrale - Haut Val-de-Marne - Plateau Briand',
       'T12 Val de Bièvres - Seine Amont - Grand Orly')
names(myColors) <- levels(deux$Territoire)

ggplot() + geom_polygon(data=b,aes(long,lat,group=group,fill=Territoire),col='grey10',lwd=0.1) + 
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey10',lwd=1.5) +
  geom_polygon(data=d3,aes(long,lat,group=group),fill=NA,col='grey50',lwd=1)+
  scale_fill_manual(name = "",values = myColors, labels=lab, guide = guide_legend(title.position = NULL)) + 
  geom_text(data=u,aes(x=x,y=y,label=row.names(u)),size=7,col='black')+
  coord_fixed() + ggtitle("Les 12 territoires du Grand Paris")+
  theme_opts + theme(legend.position="top")


# 2014 code PMSI
#importT("P:/Pressiat/Démographie/Codes Insee - Codes ATIH","corresp")

# 2015 code PMSI
importT("P:/Pressiat/Démographie/Codes Insee - Codes ATIH/2015","corresp2015")
corresp<-corresp2015

corr2<-inner_join(corresp,deux,by=c("INSEE_CO"="INSEE_COM"))

nrow(corr2 %>% distinct(ATIH_COM))

cr<-corr2 %>% count(ATIH_COM)
corr2$LibTerr<-factor(as.numeric(corr2$Territoire),levels=1:12,labels=lab)

write_delim(corr2,"Grand_Paris.txt")


gArea(d2[d2@data$Te=='T11',])/10^6

#corr2<-read_delim("Grand_Paris.txt",delim=" ")


