####

###
##This is the R script to generate violin plot.

##Copyright (C) 2022 - Trupti Gore.

# 
##
setwd("~/07-ImageAnalysis/Kinetochore-Particle-Tracker/GraphAnalysis/Siwen/KTProtein")
#wt time and violin to compare
library("gmodels")
library("DescTools")
library("ggplot2")
library("qqplotr")
library("dplyr")
library("ggpubr")
library("plyr")
library("stringr")
library("cowplot")
library("RColorBrewer")
library("ggsci")
library("extrafont")
#loadfonts(device = "postscript")
#loadfonts(device="pdf")



# Siwen Data --------------------------------------------------------------

####

###
##This is the R script to generate violin plot.

##Copyright (C) 2022 - Trupti Gore.

df<- read.csv("KTProtein_Siwen_combined_graphs.csv")
View(df)
### shorten the names of the files, to group together on names. eg.T0.tif, T1.tif etc
df$fname_particle <- str_sub(df$fname_particle, -7)
colnames(df)
### find the details : eg. particle numbers, mean, sd etc

# mask@kt:mask@cyto/particle@kt:particle@cyto -----------------------------


df %>% select(condition,mask.kt.mask.cyto.particle.kt.particle.cyto) %>% group_by(condition) %>% 
  dplyr::summarise(n = n(), 
                   mean = mean(mask.kt.mask.cyto.particle.kt.particle.cyto, na.rm = TRUE), 
                   sd = sd(mask.kt.mask.cyto.particle.kt.particle.cyto, na.rm = TRUE),
                   stderr = sd/sqrt(n),
                   LCL = mean - qt(1 - (0.05 / 2), n - 1) * stderr,
                   UCL = mean + qt(1 - (0.05 / 2), n - 1) * stderr,
                   median = median(mask.kt.mask.cyto.particle.kt.particle.cyto, na.rm = TRUE),
                   min = min(mask.kt.mask.cyto.particle.kt.particle.cyto, na.rm = TRUE), 
                   max = max(mask.kt.mask.cyto.particle.kt.particle.cyto, na.rm = TRUE),
                   IQR = IQR(mask.kt.mask.cyto.particle.kt.particle.cyto, na.rm = TRUE),
                   LCLmed = MedianCI(mask.kt.mask.cyto.particle.kt.particle.cyto, na.rm=TRUE)[2],
                   UCLmed = MedianCI(mask.kt.mask.cyto.particle.kt.particle.cyto, na.rm=TRUE)[3])

# Mean intensity particle : mean intensity mask ---------------------------
my_comparisons=list(c("Interphase","Mitosis"))
my_comparisons
#View(df)
df %>%
  ggplot(aes(x=condition, y = mean_intensity_particle.mean_intensity_mask)) +
  geom_violin() + 
  geom_jitter(aes(color=condition),width = 0.25)+
  #geom_boxplot(width = 0.1)+
  #scale_fill_manual(values = c("steelblue4", "steelblue4"))+
  stat_summary(fun=mean, geom="point", shape=10, size=3.5, color="black") + 
  ggtitle("Mean intensity Particle:Mean intensity Mask ") + 
  #xlab("")+
  #ylab("Ratio of SKA@Kt and SKA@Cyto Intensities")+
  theme(plot.title = element_text(size = 14,family="Arial"))+
  theme(axis.title.y = element_text(size = 12,family="Arial"))  +
  theme(axis.title.x = element_text(size = 10,family="Arial")) +
  theme(axis.text.x=element_text(size=10,family="Arial",face="bold"))+
  #ylim(0,2)+
  theme(legend.position="none")+
  stat_compare_means(comparisons=my_comparisons,label = "p.signif")+
  #stat_compare_means(label = "p.signif")+
  scale_x_discrete(limits=c("Interphase","Mitosis"),labels= paste0(c('Interphase\nn=1\nParticles=154','Mitosis\nn=1\nParticles=161') ))+
  theme(panel.background = element_blank())+
  theme(panel.grid.major = element_blank())+
  theme(panel.grid.minor = element_blank())



df %>%
  ggplot(aes(x=condition, y = mean_intensity_particle)) +
  geom_violin() + 
  geom_jitter(aes(color=condition),width = 0.25)+
  #geom_boxplot(width = 0.1)+
  #scale_fill_manual(values = c("steelblue4", "steelblue4"))+
  stat_summary(fun=mean, geom="point", shape=10, size=3.5, color="black") + 
  ggtitle("Mean intensity Particle ") + 
  #xlab("")+
  theme(plot.title = element_text(size = 14,family="Arial"))+
  theme(axis.title.y = element_text(size = 12,family="Arial"))  +
  theme(axis.title.x = element_text(size = 10,family="Arial")) +
  theme(axis.text.x=element_text(size=10,family="Arial",face="bold"))+
  #ylim(0,2)+
  theme(legend.position="none")+
  stat_compare_means(comparisons=my_comparisons,label = "p.signif")+
  #stat_compare_means(label = "p.signif")+
  scale_x_discrete(limits=c("Interphase","Mitosis"),labels= paste0(c('Interphase\nn=1\nParticles=154','Mitosis\nn=1\nParticles=161') ))+
  theme(panel.background = element_blank())+
  theme(panel.grid.major = element_blank())+
  theme(panel.grid.minor = element_blank())

df %>%
  ggplot(aes(x=condition, y = mean_intensity_mask)) +
  geom_violin() + 
  geom_jitter(aes(color=condition),width = 0.25)+
  #geom_boxplot(width = 0.1)+
  #scale_fill_manual(values = c("steelblue4", "steelblue4"))+
  stat_summary(fun=mean, geom="point", shape=10, size=3.5, color="black") + 
  ggtitle("Mean intensity Mask ") + 
  #xlab("")+
  theme(plot.title = element_text(size = 14,family="Arial"))+
  theme(axis.title.y = element_text(size = 12,family="Arial"))  +
  theme(axis.title.x = element_text(size = 10,family="Arial")) +
  theme(axis.text.x=element_text(size=10,family="Arial",face="bold"))+
  #ylim(0,2)+
  theme(legend.position="none")+
  stat_compare_means(comparisons=my_comparisons,label = "p.signif")+
  #stat_compare_means(label = "p.signif")+
  scale_x_discrete(limits=c("Interphase","Mitosis"),labels= paste0(c('Interphase\nn=1\nParticles=154','Mitosis\nn=1\nParticles=161') ))+
  theme(panel.background = element_blank())+
  theme(panel.grid.major = element_blank())+
  theme(panel.grid.minor = element_blank())
