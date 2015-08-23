# The orignal data was downloaded from GSSExplorer
source("./data/GSS.R")
# Modifications of the randomization data set
GSS$RELIG[GSS$RELIG == 98 | GSS$RELIG == 99]<-NA
GSS$EDUC[GSS$EDUC == 98]<-NA
GSS$RACE[GSS$RACE == 0]<-NA
GSS$ZODIAC[GSS$ZODIAC == 98 | GSS$ZODIAC == 99]<-NA
GSS$AGE[GSS$AGE == 98 | GSS$AGE == 99]<-NA

GSS$RELIG<-factor(GSS$RELIG, levels = c(99,98, 13,12,11,10,9,8,7,6,5,4,3,2,1,9),
                  labels =  c("No answer",
                              "Don't know",
                              "Inter-nondenominational",
                              "Native american",
                              "Christian",
                              "Orthodox-christian",
                              "Moslem/islam",
                              "Other eastern",
                              "Hinduism",
                              "Buddhism",
                              "Other",
                              "None",
                              "Jewish",
                              "Catholic",
                              "Protestant",
                              "Not applicable")
)
GSS$RACE<-factor(
  GSS$RACE, levels=c(3,2,1,0), labels = c(
    "Other"
    ,        "Black"
    ,        "White"
    ,        "Not Applicable"
  )
)
GSS$SEX<-factor(
  GSS$SEX, levels=c(2,1), labels = c(
    "Female"
    , "Male"
    
  )
)
GSS$ZODIAC<-factor(
  GSS$ZODIAC,
  levels = c(99, 98, 12,11,10,9,8,7,6,5,4,3,2,1,0),
  labels = c(
    "No answer"
    ,"Don't know"
    ,"Pisces"
    ,"Aquarius"
    ,"Capricorn"
    ,"Sagittarius"
    ,"Scorpio"
    ,"Libra"
    ,"Virgo"
    ,"Leo"
    ,"Cancer"
    , "Gemini"
    , "Taurus"
    , "Aries"
    , "Not applicable"
  )
)


#Create analysis data sets
GSS250<-GSS[sample(nrow(GSS), 250), ]
GSS100<-GSS[sample(nrow(GSS), 100), ]
save(GSS, file="data/GSS.Rdata")
save(GSS250, file='data/GSS250.Rdata')
save(GSS100, file='data/GSS100.Rdata')


