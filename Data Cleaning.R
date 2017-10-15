#Leer las bases de datos de una carpeta especifica
# cargar libreria "Heaven"

library(haven)

IEFIC_2010 <- read_sav("C:/Users/Esteban/Desktop/Tesis MBA/IEFIC_2010/IEFIC_2010.sav")

IEFIC_2011 <- read_sav("C:/Users/Esteban/Desktop/Tesis MBA/IEFIC_2011/IEFIC_2011.sav")

IEFIC_2012 <- read_sav("C:/Users/Esteban/Desktop/Tesis MBA/IEFIC_2012/IEFIC_2012.sav")

IEFIC_2013 <- read_sav("C:/Users/Esteban/Desktop/Tesis MBA/IEFIC_2013/IEFIC_2013.sav")

IEFIC_2014 <- read_sav("C:/Users/Esteban/Desktop/Tesis MBA/IEFIC_2014/IEFIC_2014.sav")

IEFIC_2015 <- read_sav("C:/Users/Esteban/Desktop/Tesis MBA/IEFIC_2015/IEFIC_2015.sav")

IEFIC_2016 <- read_sav("C:/Users/Esteban/Desktop/Tesis MBA/IEFIC_2016/IEFIC_2016.sav")

#cargar ibrerias para el manejo de datos

library(bindr)

library(dplyr)

library(plyr)

library(data.table)

# determinar si existe alguna diferencie entre la base de datos 2016 y el resto, 
# ya que no empareja en el primer intento

setdiff(IEFIC_2016, IEFIC_2015)

#Renombrar las columnas para dejar la base de datos homogenea

setnames(IEFIC_2016, old=c("P5000","P5002"), new=c("p5000", "p5002"))

# Realizar el ajuste a variables que se requiera previo a unir las bases de datos

# A la variables de ingresos y gastos se les divide por el salario mínimo de cada año y así tener un dato comparable año a ano

salmin2010 <- 515000

salmin2011 <- 535600

salmin2012 <- 566700

salmin2013 <- 589500

salmin2014 <- 616000

salmin2015 <- 644350

salmin2016 <- 689455

IEFIC_2010 <- transform(IEFIC_2010, INGTOTOB = (INGTOTOB/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, INGTOTOB = (INGTOTOB/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, INGTOTOB = (INGTOTOB/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, INGTOTOB = (INGTOTOB/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, INGTOTOB = (INGTOTOB/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, INGTOTOB = (INGTOTOB/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, INGTOTOB = (INGTOTOB/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_1 = (P2478_1/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_1 = (P2478_1/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_1 = (P2478_1/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_1 = (P2478_1/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_1 = (P2478_1/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_1 = (P2478_1/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_1 = (P2478_1/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_2 = (P2478_2/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_2 = (P2478_2/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_2 = (P2478_2/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_2 = (P2478_2/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_2 = (P2478_2/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_2 = (P2478_2/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_2 = (P2478_2/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_3 = (P2478_3/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_3 = (P2478_3/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_3 = (P2478_3/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_3 = (P2478_3/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_3 = (P2478_3/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_3 = (P2478_3/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_3 = (P2478_3/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_4 = (P2478_4/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_4 = (P2478_4/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_4 = (P2478_4/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_4 = (P2478_4/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_4 = (P2478_4/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_4 = (P2478_4/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_4 = (P2478_4/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_5 = (P2478_5/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_5 = (P2478_5/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_5 = (P2478_5/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_5 = (P2478_5/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_5 = (P2478_5/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_5 = (P2478_5/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_5 = (P2478_5/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_6 = (P2478_6/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_6 = (P2478_6/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_6 = (P2478_6/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_6 = (P2478_6/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_6 = (P2478_6/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_6 = (P2478_6/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_6 = (P2478_6/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_7 = (P2478_7/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_7 = (P2478_7/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_7 = (P2478_7/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_7 = (P2478_7/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_7 = (P2478_7/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_7 = (P2478_7/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_7 = (P2478_7/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_8 = (P2478_8/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_8 = (P2478_8/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_8 = (P2478_8/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_8 = (P2478_8/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_8 = (P2478_8/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_8 = (P2478_8/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_8 = (P2478_8/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_9 = (P2478_9/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_9 = (P2478_9/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_9 = (P2478_9/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_9 = (P2478_9/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_9 = (P2478_9/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_9 = (P2478_9/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_9 = (P2478_9/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_10 = (P2478_10/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_10 = (P2478_10/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_10 = (P2478_10/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_10 = (P2478_10/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_10 = (P2478_10/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_10 = (P2478_10/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_10 = (P2478_10/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_11 = (P2478_11/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_11 = (P2478_11/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_11 = (P2478_11/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_11 = (P2478_11/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_11 = (P2478_11/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_11 = (P2478_11/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_11 = (P2478_11/salmin2016))

IEFIC_2010 <- transform(IEFIC_2010, P2478_12 = (P2478_12/salmin2010))
IEFIC_2011 <- transform(IEFIC_2011, P2478_12 = (P2478_12/salmin2011))
IEFIC_2012 <- transform(IEFIC_2012, P2478_12 = (P2478_12/salmin2012))
IEFIC_2013 <- transform(IEFIC_2013, P2478_12 = (P2478_12/salmin2013))
IEFIC_2014 <- transform(IEFIC_2014, P2478_12 = (P2478_12/salmin2014))
IEFIC_2015 <- transform(IEFIC_2015, P2478_12 = (P2478_12/salmin2015))
IEFIC_2016 <- transform(IEFIC_2016, P2478_12 = (P2478_12/salmin2016))

# Unir las bases de datos

IEFIC_GENERAL <- rbind(IEFIC_2010, IEFIC_2011, IEFIC_2012, IEFIC_2013, IEFIC_2014, IEFIC_2015, IEFIC_2016)

#definir las variables seleccionadas

IEFIC_GENERALVarList <- c("ANIO" ,
                          "INGTOTOB" ,
                          "P10" ,
                          "P1239" ,
                          "P2439" ,
                          "P2469" ,
                          "P2470" ,
                          "P2472" ,
                          "P2476" ,
                          "P2476_1" ,
                          "P2476_2" ,
                          "P2476_3" ,
                          "P2476_4" ,
                          "P2476_5" ,
                          "P2476_6" ,
                          "P2476_7" ,
                          "P2476_8" ,
                          "P2476_9" ,
                          "P2476_10" ,
                          "P2476_11" ,
                          "P2478" ,
                          "P2478_1" ,
                          "P2478_2" ,
                          "P2478_3" ,
                          "P2478_4" ,
                          "P2478_5" ,
                          "P2478_6" ,
                          "P2478_7" ,
                          "P2478_8" ,
                          "P2478_9" ,
                          "P2478_10" ,
                          "P2478_11" ,
                          "P2478_12" ,
                          "P2478_2" ,
                          "P2478_3" ,
                          "P2478_8" ,
                          "P2478_9" ,
                          "P2479" ,
                          "P2480" ,
                          "P2483" ,
                          "P2496" ,
                          "P2502" ,
                          "P2504" ,
                          "P2506" ,
                          "P2508" ,
                          "P2509" ,
                          "P2510" ,
                          "P2511" ,
                          "P2512" ,
                          "P2513" ,
                          "P2536" ,
                          "P2537" ,
                          "P2538" ,
                          "P2539" ,
                          "P354" ,
                          "P358" ,
                          "P2584" ,
                          "P362" ,
                          "P368" ,
                          "P370" ,
                          "P376" ,
                          "P379" ,
                          "P382" ,
                          "P2819" ,
                          "P2970" ,
                          "P2975" ,
                          "P2982" ,
                          "P622")

#definir base de datos con el subgrupo seleccionado

IEFIC_GENERAL_b <- IEFIC_GENERAL[IEFIC_GENERALVarList]

#verificar N° columnas

colnames(IEFIC_GENERAL_b)

#verificar N° filas

nrow(IEFIC_GENERAL_b)

#definir base de datos de solo registros que generen un sueldo

IEFIC_GENERAL_c <- subset(IEFIC_GENERAL_b, INGTOTOB!=0)

#verificamos la base de datos

IEFIC_GENERAL_c$INGTOTOB

#verificamos la cantidad de datos de la nueva base de datos

nrow(IEFIC_GENERAL_c)

# copiamos la base de datos

IEFIC_GENERAL_d <- IEFIC_GENERAL_c

# Acorde a los ingresos clasificamos en 4 grupos facilitando el análisis

IEFIC_GENERAL_d$INGRESOSTOT <- 0

IEFIC_GENERAL_d$INGRESOSTOT[IEFIC_GENERAL_d$INGTOTOB <= 1.5 ] <- 1 
IEFIC_GENERAL_d$INGRESOSTOT[IEFIC_GENERAL_d$INGTOTOB > 1.5 & IEFIC_GENERAL_d$INGTOTOB <= 2.6] <- 2
IEFIC_GENERAL_d$INGRESOSTOT[IEFIC_GENERAL_d$INGTOTOB > 2.6 & IEFIC_GENERAL_d$INGTOTOB <= 3.8] <- 3
IEFIC_GENERAL_d$INGRESOSTOT[IEFIC_GENERAL_d$INGTOTOB > 3.8 & IEFIC_GENERAL_d$INGTOTOB <= 4.8] <- 4
IEFIC_GENERAL_d$INGRESOSTOT[IEFIC_GENERAL_d$INGTOTOB > 4.8 ] <- 5

# Asignamos vectores a las nuevas clasificaciones

IEFIC_GENERAL_d$ALIME <- 0
IEFIC_GENERAL_d$VESTU <- 0
IEFIC_GENERAL_d$AGUA <- 0
IEFIC_GENERAL_d$LUZ <- 0
IEFIC_GENERAL_d$GAS <- 0
IEFIC_GENERAL_d$TELEF <- 0
IEFIC_GENERAL_d$SERDO <- 0
IEFIC_GENERAL_d$RECRE <- 0
IEFIC_GENERAL_d$SALUD <- 0
IEFIC_GENERAL_d$INTER <- 0
IEFIC_GENERAL_d$TRANS <- 0
IEFIC_GENERAL_d$PEMAN <- 0

# Clasificacmos en grupos para faciliatr el análisis

IEFIC_GENERAL_d$ALIME[IEFIC_GENERAL_d$P2478_1 <= 0.25 ] <- 1 
IEFIC_GENERAL_d$ALIME[IEFIC_GENERAL_d$P2478_1 > 0.25 & IEFIC_GENERAL_d$P2478_2 <= 0.5] <- 2 
IEFIC_GENERAL_d$ALIME[IEFIC_GENERAL_d$P2478_1 > 0.5 & IEFIC_GENERAL_d$P2478_2 <= 0.75] <- 3 
IEFIC_GENERAL_d$ALIME[IEFIC_GENERAL_d$P2478_1 > 0.75 & IEFIC_GENERAL_d$P2478_2 <= 1] <- 4   
IEFIC_GENERAL_d$ALIME[IEFIC_GENERAL_d$P2478_1 > 1 ] <- 5

IEFIC_GENERAL_d$VESTU[IEFIC_GENERAL_d$P2478_2 <= 0.25 ] <- 1
IEFIC_GENERAL_d$VESTU[IEFIC_GENERAL_d$P2478_2 > 0.25 & IEFIC_GENERAL_d$P2478_3 <= 0.5] <- 2
IEFIC_GENERAL_d$VESTU[IEFIC_GENERAL_d$P2478_2 > 0.5 & IEFIC_GENERAL_d$P2478_3 <= 0.75] <- 3
IEFIC_GENERAL_d$VESTU[IEFIC_GENERAL_d$P2478_2 > 0.75 & IEFIC_GENERAL_d$P2478_3 <= 1] <- 4
IEFIC_GENERAL_d$VESTU[IEFIC_GENERAL_d$P2478_2 > 1 ] <- 5

IEFIC_GENERAL_d$AGUA[IEFIC_GENERAL_d$P2478_3 <= 0.25 ] <- 1
IEFIC_GENERAL_d$AGUA[IEFIC_GENERAL_d$P2478_3 > 0.25 & IEFIC_GENERAL_d$P2478_3 <= 0.5] <- 2
IEFIC_GENERAL_d$AGUA[IEFIC_GENERAL_d$P2478_3 > 0.5 & IEFIC_GENERAL_d$P2478_3 <= 0.75] <- 3
IEFIC_GENERAL_d$AGUA[IEFIC_GENERAL_d$P2478_3 > 0.75 & IEFIC_GENERAL_d$P2478_3 <= 4.8] <- 4
IEFIC_GENERAL_d$AGUA[IEFIC_GENERAL_d$P2478_3 > 1 ] <- 5

IEFIC_GENERAL_d$LUZ[IEFIC_GENERAL_d$P2478_4 <= 0.25 ] <- 1
IEFIC_GENERAL_d$LUZ[IEFIC_GENERAL_d$P2478_4 > 0.25 & IEFIC_GENERAL_d$P2478_4 <= 0.5] <- 2
IEFIC_GENERAL_d$LUZ[IEFIC_GENERAL_d$P2478_4 > 0.5 & IEFIC_GENERAL_d$P2478_4 <= 0.75] <- 3
IEFIC_GENERAL_d$LUZ[IEFIC_GENERAL_d$P2478_4 > 0.75 & IEFIC_GENERAL_d$P2478_4 <= 1] <- 4
IEFIC_GENERAL_d$LUZ[IEFIC_GENERAL_d$P2478_4 > 1 ] <- 5

IEFIC_GENERAL_d$GAS[IEFIC_GENERAL_d$P2478_5 <= 0.25 ] <- 1
IEFIC_GENERAL_d$GAS[IEFIC_GENERAL_d$P2478_5 > 0.25 & IEFIC_GENERAL_d$P2478_5 <= 0.5] <- 2
IEFIC_GENERAL_d$GAS[IEFIC_GENERAL_d$P2478_5 > 0.5 & IEFIC_GENERAL_d$P2478_5 <= 0.75] <- 3
IEFIC_GENERAL_d$GAS[IEFIC_GENERAL_d$P2478_5 > 0.75 & IEFIC_GENERAL_d$P2478_5 <= 1] <- 4
IEFIC_GENERAL_d$GAS[IEFIC_GENERAL_d$P2478_5 > 1 ] <- 5

IEFIC_GENERAL_d$TELEF[IEFIC_GENERAL_d$P2478_6 <= 0.25 ] <- 1
IEFIC_GENERAL_d$TELEF[IEFIC_GENERAL_d$P2478_6 > 0.25 & IEFIC_GENERAL_d$P2478_6 <= 0.5] <- 2
IEFIC_GENERAL_d$TELEF[IEFIC_GENERAL_d$P2478_6 > 0.5 & IEFIC_GENERAL_d$P2478_6 <= 0.75] <- 3
IEFIC_GENERAL_d$TELEF[IEFIC_GENERAL_d$P2478_6 > 0.75 & IEFIC_GENERAL_d$P2478_6 <= 1] <- 4
IEFIC_GENERAL_d$TELEF[IEFIC_GENERAL_d$P2478_6 > 1 ] <- 5

IEFIC_GENERAL_d$SERDO[IEFIC_GENERAL_d$P2478_7 <= 0.25 ] <- 1
IEFIC_GENERAL_d$SERDO[IEFIC_GENERAL_d$P2478_7 > 0.25 & IEFIC_GENERAL_d$P2478_7 <= 0.5] <- 2
IEFIC_GENERAL_d$SERDO[IEFIC_GENERAL_d$P2478_7 > 0.5 & IEFIC_GENERAL_d$P2478_7 <= 0.75] <- 3
IEFIC_GENERAL_d$SERDO[IEFIC_GENERAL_d$P2478_7 > 0.75 & IEFIC_GENERAL_d$P2478_7 <= 1] <- 4
IEFIC_GENERAL_d$SERDO[IEFIC_GENERAL_d$P2478_7 > 1 ] <- 5

IEFIC_GENERAL_d$RECRE[IEFIC_GENERAL_d$P2478_8 <= 0.25 ] <- 1
IEFIC_GENERAL_d$RECRE[IEFIC_GENERAL_d$P2478_8 > 0.25 & IEFIC_GENERAL_d$P2478_8 <= 0.5] <- 2
IEFIC_GENERAL_d$RECRE[IEFIC_GENERAL_d$P2478_8 > 0.5 & IEFIC_GENERAL_d$P2478_8 <= 0.75] <- 3
IEFIC_GENERAL_d$RECRE[IEFIC_GENERAL_d$P2478_8 > 0.75 & IEFIC_GENERAL_d$P2478_8 <= 1] <- 4
IEFIC_GENERAL_d$RECRE[IEFIC_GENERAL_d$P2478_8 > 1 ] <- 5

IEFIC_GENERAL_d$SALUD[IEFIC_GENERAL_d$P2478_9 <= 0.25 ] <- 1
IEFIC_GENERAL_d$SALUD[IEFIC_GENERAL_d$P2478_9 > 0.25 & IEFIC_GENERAL_d$P2478_9 <= 0.5] <- 2
IEFIC_GENERAL_d$SALUD[IEFIC_GENERAL_d$P2478_9 > 0.5 & IEFIC_GENERAL_d$P2478_9 <= 0.75] <- 3
IEFIC_GENERAL_d$SALUD[IEFIC_GENERAL_d$P2478_9 > 0.75 & IEFIC_GENERAL_d$P2478_9 <= 1] <- 4
IEFIC_GENERAL_d$SALUD[IEFIC_GENERAL_d$P2478_9 > 1 ] <- 5

IEFIC_GENERAL_d$INTER[IEFIC_GENERAL_d$P2478_10 <= 0.25 ] <- 1
IEFIC_GENERAL_d$INTER[IEFIC_GENERAL_d$P2478_10 > 0.25 & IEFIC_GENERAL_d$P2478_10 <= 0.5] <- 2
IEFIC_GENERAL_d$INTER[IEFIC_GENERAL_d$P2478_10 > 0.5 & IEFIC_GENERAL_d$P2478_10 <= 0.75] <- 3
IEFIC_GENERAL_d$INTER[IEFIC_GENERAL_d$P2478_10 > 0.75 & IEFIC_GENERAL_d$P2478_10 <= 1] <- 4
IEFIC_GENERAL_d$INTER[IEFIC_GENERAL_d$P2478_10 > 1 ] <- 5

IEFIC_GENERAL_d$TRANS[IEFIC_GENERAL_d$P2478_11 <= 0.25 ] <- 1
IEFIC_GENERAL_d$TRANS[IEFIC_GENERAL_d$P2478_11 > 0.25 & IEFIC_GENERAL_d$P2478_11 <= 0.5] <- 2
IEFIC_GENERAL_d$TRANS[IEFIC_GENERAL_d$P2478_11 > 0.5 & IEFIC_GENERAL_d$P2478_11 <= 0.75] <- 3
IEFIC_GENERAL_d$TRANS[IEFIC_GENERAL_d$P2478_11 > 0.75 & IEFIC_GENERAL_d$P2478_11 <= 1] <- 4
IEFIC_GENERAL_d$TRANS[IEFIC_GENERAL_d$P2478_11 > 1 ] <- 5

IEFIC_GENERAL_d$PEMAN[IEFIC_GENERAL_d$P2478_12 <= 0.25 ] <- 1
IEFIC_GENERAL_d$PEMAN[IEFIC_GENERAL_d$P2478_12 > 0.25 & IEFIC_GENERAL_d$P2478_12 <= 0.5] <- 2
IEFIC_GENERAL_d$PEMAN[IEFIC_GENERAL_d$P2478_12 > 0.5 & IEFIC_GENERAL_d$P2478_12 <= 0.75] <- 3
IEFIC_GENERAL_d$PEMAN[IEFIC_GENERAL_d$P2478_12 > 0.75 & IEFIC_GENERAL_d$P2478_12 <= 1] <- 4
IEFIC_GENERAL_d$PEMAN[IEFIC_GENERAL_d$P2478_12 > 1 ] <- 5


#clasificamos en 6 grupos por nivel educativo, acorde a clasificación DANE

IEFIC_GENERAL_d$P10[IEFIC_GENERAL_d$P10 == 100 ] <- 1
IEFIC_GENERAL_d$P10[IEFIC_GENERAL_d$P10 >=200 & IEFIC_GENERAL_d$P10 <300] <- 2
IEFIC_GENERAL_d$P10[IEFIC_GENERAL_d$P10 >=300 & IEFIC_GENERAL_d$P10 <400] <- 3
IEFIC_GENERAL_d$P10[IEFIC_GENERAL_d$P10 >=400 & IEFIC_GENERAL_d$P10 <500] <- 4
IEFIC_GENERAL_d$P10[IEFIC_GENERAL_d$P10 >=500 & IEFIC_GENERAL_d$P10 <600] <- 5
IEFIC_GENERAL_d$P10[IEFIC_GENERAL_d$P10 >=600 & IEFIC_GENERAL_d$P10 <700] <- 6

#visualizamos

IEFIC_GENERAL_d$P10

# Generamso los respectivo vectores para la calificación del exámen de educcaión financiera y asignamos el puntaje

IEFIC_GENERAL_d$CALIF1 <- 0
IEFIC_GENERAL_d$CALIF1[IEFIC_GENERAL_d$P2508 == 1] <- 1
IEFIC_GENERAL_d$CALIF2 <- 0
IEFIC_GENERAL_d$CALIF2[IEFIC_GENERAL_d$P2509 == 1] <- 1
IEFIC_GENERAL_d$CALIF3 <- 0
IEFIC_GENERAL_d$CALIF3[IEFIC_GENERAL_d$P2510 == 3] <- 1
IEFIC_GENERAL_d$CALIF4 <- 0
IEFIC_GENERAL_d$CALIF4[IEFIC_GENERAL_d$P2511 == 1] <- 1
IEFIC_GENERAL_d$CALIF5 <- 0
IEFIC_GENERAL_d$CALIF5[IEFIC_GENERAL_d$P2512 == 2] <- 1
IEFIC_GENERAL_d$CALIF6 <- 0
IEFIC_GENERAL_d$CALIF6[IEFIC_GENERAL_d$P2513 == 2] <- 1
IEFIC_GENERAL_d$CALIF7 <- 0
IEFIC_GENERAL_d$CALIF7[IEFIC_GENERAL_d$P2536 == 3] <- 1
IEFIC_GENERAL_d$CALIF8 <- 0
IEFIC_GENERAL_d$CALIF8[IEFIC_GENERAL_d$P2537 == 1] <- 1
IEFIC_GENERAL_d$CALIF9 <- 0
IEFIC_GENERAL_d$CALIF9[IEFIC_GENERAL_d$P2538 == 1] <- 1
IEFIC_GENERAL_d$CALIF10 <- 0
IEFIC_GENERAL_d$CALIF10[IEFIC_GENERAL_d$P2539 == 3] <- 1
IEFIC_GENERAL_d$CALIFTOTAL <- 0

#Genermaos el vector con la calificación total por registro

IEFIC_GENERAL_d$CALIFTOTAL <- (IEFIC_GENERAL_d$CALIF1 +
                                 IEFIC_GENERAL_d$CALIF2 +
                                 IEFIC_GENERAL_d$CALIF3 +
                                 IEFIC_GENERAL_d$CALIF4 +
                                 IEFIC_GENERAL_d$CALIF5 +
                                 IEFIC_GENERAL_d$CALIF6 +
                                 IEFIC_GENERAL_d$CALIF7 +
                                 IEFIC_GENERAL_d$CALIF8 +
                                 IEFIC_GENERAL_d$CALIF9 +
                                 IEFIC_GENERAL_d$CALIF10)

#visualizamos las notas

a <- table(IEFIC_GENERAL_d$CALIFTOTAL)

a

#Ajustamos la variable de tenencia de CDT

IEFIC_GENERAL_d$CDT <- 0

IEFIC_GENERAL_d$CDT[IEFIC_GENERAL_d$P1239 == 1] <- 1

# Copiamos la base de datos

IEFIC_GENERAL_e <- IEFIC_GENERAL_d

#Definimos una nueva base de datos con solo la población que posee vivienda propia, ay que acorde a la
#encuesta fueron los unicos a quienes se les pregunto por crédito hipotecario descartando el hecho de vivir en casa arrendada y 
#tener crédito hipotecario.

IEFIC_GENERAL_f <- subset(IEFIC_GENERAL_e , P2439 == 1)

#Ajustamos la variable de tenencia de CONDCRE

IEFIC_GENERAL_f$CONDCRE <- 0

IEFIC_GENERAL_f$CONDCRE[IEFIC_GENERAL_f$P2469 == 1] <- 1

#Ajustamos la variable de tenencia de MORACRE

IEFIC_GENERAL_f$MORACRE <- 0

IEFIC_GENERAL_f$MORACRE[IEFIC_GENERAL_f$P2470 ==1 | IEFIC_GENERAL_f$P2470 ==2 ] <- 1

b <- table(IEFIC_GENERAL_f$MORACRE)

b

##Ajustamos la variable de tenencia de electrodomesticos y para efectos de ese estudio, solo será relevante la suma
IEFIC_GENERAL_f$ELECTRO <- 0

IEFIC_GENERAL_f$ELECTRO <-(IEFIC_GENERAL_f$P2476_1 +
                             IEFIC_GENERAL_f$P2476_2 +
                             IEFIC_GENERAL_f$P2476_3 +
                             IEFIC_GENERAL_f$P2476_4 +
                             IEFIC_GENERAL_f$P2476_5 +
                             IEFIC_GENERAL_f$P2476_6 +
                             IEFIC_GENERAL_f$P2476_7 +
                             IEFIC_GENERAL_f$P2476_8 +
                             IEFIC_GENERAL_f$P2476_9 +
                             IEFIC_GENERAL_f$P2476_10 +
                             IEFIC_GENERAL_f$P2476_11)

#Agrupamos en una clasificación de 5 acorde al número de electrodomesticos

IEFIC_GENERAL_f$ELECTROTOT

IEFIC_GENERAL_f$ELECTROTOT[IEFIC_GENERAL_f$ELECTRO <= 6 ] <- 1
IEFIC_GENERAL_f$ELECTROTOT[IEFIC_GENERAL_f$ELECTRO > 6 & IEFIC_GENERAL_f$ELECTRO <= 12] <- 2
IEFIC_GENERAL_f$ELECTROTOT[IEFIC_GENERAL_f$ELECTRO > 12 & IEFIC_GENERAL_f$ELECTRO <= 18] <- 3
IEFIC_GENERAL_f$ELECTROTOT[IEFIC_GENERAL_f$ELECTRO > 18 & IEFIC_GENERAL_f$ELECTRO <= 24] <- 4
IEFIC_GENERAL_f$ELECTROTOT[IEFIC_GENERAL_f$ELECTRO > 24 & IEFIC_GENERAL_f$ELECTRO <= 1089 ] <- 5

# asignamos el valor de 0 a los datos faltantes de la variable ELECTROTOT

IEFIC_GENERAL_f$ELECTROTOT[is.na(IEFIC_GENERAL_f$ELECTROTOT)] <- 0

#renombramos las variables de estudio

IEFIC_GENERAL_f$VIVIEXTRA <- 0

IEFIC_GENERAL_f$VIVIEXTRA[IEFIC_GENERAL_f$P2483 == 1] <- 1

IEFIC_GENERAL_f$SEMOVI <- 0

IEFIC_GENERAL_f$SEMOVI[IEFIC_GENERAL_f$P2496 == 1] <- 1

IEFIC_GENERAL_f$VEHICU <- 0

IEFIC_GENERAL_f$VEHICU[IEFIC_GENERAL_f$P2502 == 1] <- 1

IEFIC_GENERAL_f$MAQUI <- 0

IEFIC_GENERAL_f$MAQUI[IEFIC_GENERAL_f$P2504 == 1] <- 1

IEFIC_GENERAL_f$SEGUR <- 0

IEFIC_GENERAL_f$SEGUR[IEFIC_GENERAL_f$P2506 == 1] <- 1

IEFIC_GENERAL_f$CUENTAHOR <- 0

IEFIC_GENERAL_f$CUENTAHOR[IEFIC_GENERAL_f$P2584 == 1] <- 1

# Clasificamos las moras en los diferentes créditos

IEFIC_GENERAL_f$MORATAR <- 0

IEFIC_GENERAL_f$MORATAR[IEFIC_GENERAL_f$P354 ==1 | IEFIC_GENERAL_f$P354==2 ] <- 1
IEFIC_GENERAL_f$MORATAR[IEFIC_GENERAL_f$P354 ==3 | 
                          IEFIC_GENERAL_f$P354 ==4 |
                          IEFIC_GENERAL_f$P354 ==8 |
                          IEFIC_GENERAL_f$P354 ==9] <- 2

IEFIC_GENERAL_f$MORACOM <- 0

IEFIC_GENERAL_f$MORACOM[IEFIC_GENERAL_f$P358 ==1 | IEFIC_GENERAL_f$P358==2 ] <- 1
IEFIC_GENERAL_f$MORACOM[IEFIC_GENERAL_f$P358 ==3 | 
                          IEFIC_GENERAL_f$P358 ==4 |
                          IEFIC_GENERAL_f$P358 ==8 |
                          IEFIC_GENERAL_f$P358 ==9] <- 2

IEFIC_GENERAL_f$MORALIB <- 0

IEFIC_GENERAL_f$MORALIB[IEFIC_GENERAL_f$P362 ==1 | IEFIC_GENERAL_f$P362==2 ] <- 1
IEFIC_GENERAL_f$MORALIB[IEFIC_GENERAL_f$P362 ==3 | 
                          IEFIC_GENERAL_f$P362 ==4 |
                          IEFIC_GENERAL_f$P362 ==8 |
                          IEFIC_GENERAL_f$P362 ==9] <- 2

IEFIC_GENERAL_f$MORAGOT <- 0

IEFIC_GENERAL_f$MORAGOT[IEFIC_GENERAL_f$P368 ==1 | IEFIC_GENERAL_f$P368==2 ] <- 1
IEFIC_GENERAL_f$MORAGOT[IEFIC_GENERAL_f$P368 ==3 | 
                          IEFIC_GENERAL_f$P368 ==4 |
                          IEFIC_GENERAL_f$P368 ==8 |
                          IEFIC_GENERAL_f$P368 ==9] <- 2

IEFIC_GENERAL_f$MORAFIA <- 0

IEFIC_GENERAL_f$MORAFIA[IEFIC_GENERAL_f$P370 ==1 | IEFIC_GENERAL_f$P370==2 ] <- 1
IEFIC_GENERAL_f$MORAFIA[IEFIC_GENERAL_f$P370 ==3 | 
                          IEFIC_GENERAL_f$P370 ==4 |
                          IEFIC_GENERAL_f$P370 ==8 |
                          IEFIC_GENERAL_f$P370 ==9] <- 2

IEFIC_GENERAL_f$MORACOP <- 0

IEFIC_GENERAL_f$MORACOP[IEFIC_GENERAL_f$P376 ==1 | IEFIC_GENERAL_f$P376==2 ] <- 1
IEFIC_GENERAL_f$MORACOP[IEFIC_GENERAL_f$P376 ==3 | 
                          IEFIC_GENERAL_f$P376 ==4 |
                          IEFIC_GENERAL_f$P376 ==8 |
                          IEFIC_GENERAL_f$P376 ==9] <- 2

IEFIC_GENERAL_f$MORAEDU <- 0

IEFIC_GENERAL_f$MORAEDU[IEFIC_GENERAL_f$P379 ==1 | IEFIC_GENERAL_f$P379==2 ] <- 1
IEFIC_GENERAL_f$MORAEDU[IEFIC_GENERAL_f$P379 ==3 | 
                          IEFIC_GENERAL_f$P379 ==4 |
                          IEFIC_GENERAL_f$P379 ==8 |
                          IEFIC_GENERAL_f$P379 ==9] <- 2

IEFIC_GENERAL_f$MORAPARI <- 0

IEFIC_GENERAL_f$MORAPARI[IEFIC_GENERAL_f$P382 ==1 | IEFIC_GENERAL_f$P382==2 ] <- 1
IEFIC_GENERAL_f$MORAPARI[IEFIC_GENERAL_f$P382 ==3 | 
                           IEFIC_GENERAL_f$P382 ==4 |
                           IEFIC_GENERAL_f$P382 ==8 |
                           IEFIC_GENERAL_f$P382 ==9] <- 2

# Definimos las categorías de activos

IEFIC_GENERAL_f$ACCION <- 0

IEFIC_GENERAL_f$ACCION[IEFIC_GENERAL_f$P2819 == 1] <- 1

IEFIC_GENERAL_f$SWAFUT <- 0

IEFIC_GENERAL_f$SWAFUT[IEFIC_GENERAL_f$P2970 == 1] <- 1

IEFIC_GENERAL_f$NIVENDE <- 0

IEFIC_GENERAL_f$NIVENDE[IEFIC_GENERAL_f$P2975 == 1] <- 1

IEFIC_GENERAL_f$NEGPROP <- 0

IEFIC_GENERAL_f$NEGPROP[IEFIC_GENERAL_f$P2982 == 1] <- 1

IEFIC_GENERAL_f$FONDOS <- 0

IEFIC_GENERAL_f$FONDOS[IEFIC_GENERAL_f$P622 == 1] <- 1

# asignamos el valor de 9 a los datos faltantes de la variable P2472

IEFIC_GENERAL_f$P2472[is.na(IEFIC_GENERAL_f$P2472)] <- 9

# asignamos el valor de 4 a los datos faltantes de la variable P2479

IEFIC_GENERAL_f$P2479[is.na(IEFIC_GENERAL_f$P2479)] <- 4

# asignamos el valor de 3 a los datos faltantes de la variable P2480

IEFIC_GENERAL_f$P2480[is.na(IEFIC_GENERAL_f$P2480)] <- 3


colnames(IEFIC_GENERAL_f)

# Creamos una nueva lista con las variables definitivas

IEFIC_GENERAL_fVarList2 <- c( "ANIO" ,
                              "INGRESOSTOT" ,
                              "P10" ,
                              "P2472" ,
                              "P2479" ,
                              "P2480" ,
                              "CALIFTOTAL" ,
                              "CDT" ,
                              "CONDCRE" ,
                              "MORACRE" ,
                              "ELECTROTOT" ,
                              "ALIME" ,
                              "VESTU" ,
                              "AGUA" ,
                              "LUZ" ,
                              "GAS" ,
                              "TELEF" ,
                              "SERDO" ,
                              "RECRE" ,
                              "SALUD" ,
                              "INTER" ,
                              "TRANS" ,
                              "PEMAN" ,
                              "VIVIEXTRA" ,
                              "SEMOVI" ,
                              "VEHICU" ,
                              "MAQUI" ,
                              "SEGUR" ,
                              "CUENTAHOR" ,
                              "MORATAR" ,
                              "MORACOM" ,
                              "MORALIB" ,
                              "MORAGOT" ,
                              "MORAFIA" ,
                              "MORACOP" ,
                              "MORAEDU" ,
                              "MORAPARI" ,
                              "ACCION" ,
                              "SWAFUT" ,
                              "NIVENDE" ,
                              "NEGPROP" ,
                              "FONDOS" )

# generamos una nueva base de datos con las variables definitivas

IEFIC_GENERAL_g <- IEFIC_GENERAL_f[IEFIC_GENERAL_fVarList2]

# escribimos la base de datos en formato CVS

write.csv(IEFIC_GENERAL_g, file = "analyticiefic.csv", row.names = FALSE)

# Leemos la base de datos escrita

analyticiefic <- read.csv(file="C:/Users/Esteban/Desktop/Tesis MBA/analyticiefic.csv", header=TRUE, sep=",")

View(analyticiefic)

# revisemos una de las variables, en este caso la entidad que facilito el crédito

f <- table(analyticiefic$P2472)
f

# revisemos frecuencias de variables 

EducCalifFreq <- table(analyticiefic$MORACRE)
EducCalifFreq

EducCalifFreq2 <- table(analyticiefic$MORACRE, analyticiefic$CALIFTOTAL)
EducCalifFreq2


#comenzamos a sacar las frecuencias por variable
#invocar la libreria "gtool" y poer hacer macros
#Asignamos tipo de variable factor a todas las variables dado que planteamos categorias en todas.

analyticiefic$ANIO<-as.factor( analyticiefic$ANIO)
analyticiefic$INGRESOSTOT<-as.factor( analyticiefic$INGRESOSTOT)
analyticiefic$P10<-as.factor( analyticiefic$P10)
analyticiefic$P2472<-as.factor( analyticiefic$P2472)
analyticiefic$P2479<-as.factor( analyticiefic$P2479)
analyticiefic$P2480<-as.factor( analyticiefic$P2480)
analyticiefic$CALIFTOTAL<-as.factor( analyticiefic$CALIFTOTAL)
analyticiefic$CDT<-as.factor( analyticiefic$CDT)
analyticiefic$CONDCRE<-as.factor( analyticiefic$CONDCRE)
analyticiefic$ELECTROTOT<-as.factor( analyticiefic$ELECTROTOT)
analyticiefic$ALIME<-as.factor( analyticiefic$ALIME)
analyticiefic$VESTU<-as.factor( analyticiefic$VESTU)
analyticiefic$AGUA<-as.factor( analyticiefic$AGUA)
analyticiefic$LUZ<-as.factor( analyticiefic$LUZ)
analyticiefic$GAS<-as.factor( analyticiefic$GAS)
analyticiefic$TELEF<-as.factor( analyticiefic$TELEF)
analyticiefic$SERDO<-as.factor( analyticiefic$SERDO)
analyticiefic$RECRE<-as.factor( analyticiefic$RECRE)
analyticiefic$SALUD<-as.factor( analyticiefic$SALUD)
analyticiefic$INTER<-as.factor( analyticiefic$INTER)
analyticiefic$TRANS<-as.factor( analyticiefic$TRANS)
analyticiefic$PEMAN<-as.factor( analyticiefic$PEMAN)
analyticiefic$VIVIEXTRA<-as.factor( analyticiefic$VIVIEXTRA)
analyticiefic$SEMOVI<-as.factor( analyticiefic$SEMOVI)
analyticiefic$VEHICU<-as.factor( analyticiefic$VEHICU)
analyticiefic$MAQUI<-as.factor( analyticiefic$MAQUI)
analyticiefic$SEGUR<-as.factor( analyticiefic$SEGUR)
analyticiefic$CUENTAHOR<-as.factor( analyticiefic$CUENTAHOR)
analyticiefic$MORATAR<-as.factor( analyticiefic$MORATAR)
analyticiefic$MORACOM<-as.factor( analyticiefic$MORACOM)
analyticiefic$MORALIB<-as.factor( analyticiefic$MORALIB)
analyticiefic$MORAGOT<-as.factor( analyticiefic$MORAGOT)
analyticiefic$MORAFIA<-as.factor( analyticiefic$MORAFIA)
analyticiefic$MORACOP<-as.factor( analyticiefic$MORACOP)
analyticiefic$MORAEDU<-as.factor( analyticiefic$MORAEDU)
analyticiefic$MORAPARI<-as.factor( analyticiefic$MORAPARI)
analyticiefic$ACCION<-as.factor( analyticiefic$ACCION)
analyticiefic$SWAFUT<-as.factor( analyticiefic$SWAFUT)
analyticiefic$NIVENDE<-as.factor( analyticiefic$NIVENDE)
analyticiefic$NEGPROP<-as.factor( analyticiefic$NEGPROP)
analyticiefic$FONDOS<-as.factor( analyticiefic$FONDOS)

analyticiefic$MORACRE<-as.factor( analyticiefic$MORACRE)


library(gtools)

#usar defmacro para definir macro

FreqTbl <-defmacro(OutputTable, InputVar, CSVTable, 
                   expr={
                     OutputTable <- table(InputVar);
                     write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
                   })

FreqTbl (AnioFreq, analyticiefic$ANIO, "Anio")
FreqTbl (IngresoFreq, analyticiefic$INGRESOSTOT, "iNGRESO")
FreqTbl (EducaFreq, analyticiefic$P10, "EDUCA")
FreqTbl (InstituFreq, analyticiefic$P2472, "INSTITUCION")
FreqTbl (GastoFreq, analyticiefic$P2479, "GASTOIN")
FreqTbl (TotalingFreq, analyticiefic$P2480, "TOTALING")
FreqTbl (CaliftFreq, analyticiefic$CALIFTOTAL, "CALIFTOTAL")
FreqTbl (CdtFreq, analyticiefic$CDT, "CDT")
FreqTbl (CondcreFreq, analyticiefic$CONDCRE, "CONDCRE")
FreqTbl (ElectFreq, analyticiefic$ELECTROTOT, "ELECTROTOT")
FreqTbl (AlimeFreq, analyticiefic$ALIME, "ALIME")
FreqTbl (VestuFreq, analyticiefic$VESTU, "VESTU")
FreqTbl (AguaFreq, analyticiefic$AGUA, "AGUA")
FreqTbl (LuzFreq, analyticiefic$LUZ, "LUZ")
FreqTbl (GasFreq, analyticiefic$GAS, "GAS")
FreqTbl (TelefFreq, analyticiefic$TELEF, "TELEF")
FreqTbl (SerdoFreq, analyticiefic$SERDO, "SERDO")
FreqTbl (RecreFreq, analyticiefic$RECRE, "RECRE")
FreqTbl (SaludFreq, analyticiefic$SALUD, "SALUD")
FreqTbl (InterFreq, analyticiefic$INTER, "INTER")
FreqTbl (TransFreq, analyticiefic$TRANS, "TRANS")
FreqTbl (PemanFreq, analyticiefic$PEMAN, "PEMAN")
FreqTbl (ViviextFreq, analyticiefic$VIVIEXTRA, "VIVIEXTRA")
FreqTbl (SemoviFreq, analyticiefic$SEMOVI, "SEMOVI")
FreqTbl (VehicFreq, analyticiefic$VEHICU, "VEHICU")
FreqTbl (MaquiFreq, analyticiefic$MAQUI, "MAQUI")
FreqTbl (SegurFreq, analyticiefic$SEGUR, "SEGUR")
FreqTbl (CuentahoFreq, analyticiefic$CUENTAHOR, "CUENTAHOR")
FreqTbl (MoratarFreq, analyticiefic$MORATAR, "MORATAR")
FreqTbl (MoracomFreq, analyticiefic$MORACOM, "MORACOM")
FreqTbl (MoralibFreq, analyticiefic$MORALIB, "MORALIB")
FreqTbl (MoragFreq, analyticiefic$MORAGOT, "MORAGOT")
FreqTbl (MorafiaFreq, analyticiefic$MORAFIA, "MORAFIA")
FreqTbl (MoracoFreq, analyticiefic$MORACOP, "MORACOP")
FreqTbl (MoraeduFreq, analyticiefic$MORAEDU, "MORAEDU")
FreqTbl (MoraparFreq, analyticiefic$MORAPARI, "MORAPARI")
FreqTbl (AccionFreq, analyticiefic$ACCION, "ACCION")
FreqTbl (SwatfutFreq, analyticiefic$SWAFUT, "SWAFUT")
FreqTbl (NivendeFreq, analyticiefic$NIVENDE, "NIVENDE")
FreqTbl (NegropFreq, analyticiefic$NEGPROP, "NEGPROP")
FreqTbl (FondosFreq, analyticiefic$FONDOS, "FONDOS")

#definir base de datos solo con mora en crédito hipotecario

solomoracred <- subset(analyticiefic, MORACRE == 1)
table(solomoracred$MORACRE)
nrow(solomoracred)

MoracreFreq <- table(analyticiefic$MORACRE)
MoracreFreq
write.csv(MoracreFreq, file = "Moracre.csv")

FreqTbl <-defmacro(OutputTable, InputVar, CSVTable, 
                   expr={
                     OutputTable <- table(InputVar);
                     write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
                   })

FreqTbl (AnioFreq, solomoracred$ANIO, "Anio")
FreqTbl (IngresoFreq, solomoracred$INGRESOSTOT , "iNGRESO")
FreqTbl (EducaFreq, solomoracred$P10, "EDUCA")
FreqTbl (InstituFreq, solomoracred$P2472, "INSTITUCION")
FreqTbl (GastoFreq, solomoracred$P2479, "GASTOIN")
FreqTbl (TotalingFreq, solomoracred$P2480, "TOTALING")
FreqTbl (CaliftFreq, solomoracred$CALIFTOTAL, "CALIFTOTAL")
FreqTbl (CdtFreq, solomoracred$CDT, "CDT")
FreqTbl (CondcreFreq, solomoracred$CONDCRE, "CONDCRE")
FreqTbl (ElectFreq, solomoracred$ELECTROTOT, "ELECTROTOT")
FreqTbl (AlimeFreq, solomoracred$ALIME, "ALIME")
FreqTbl (VestuFreq, solomoracred$VESTU, "VESTU")
FreqTbl (AguaFreq, solomoracred$AGUA, "AGUA")
FreqTbl (LuzFreq, solomoracred$LUZ, "LUZ")
FreqTbl (GasFreq, solomoracred$GAS, "GAS")
FreqTbl (TelefFreq, solomoracred$TELEF, "TELEF")
FreqTbl (SerdoFreq, solomoracred$SERDO, "SERDO")
FreqTbl (RecreFreq, solomoracred$RECRE, "RECRE")
FreqTbl (SaludFreq, solomoracred$SALUD, "SALUD")
FreqTbl (InterFreq, solomoracred$INTER, "INTER")
FreqTbl (TransFreq, solomoracred$TRANS, "TRANS")
FreqTbl (PemanFreq, solomoracred$PEMAN, "PEMAN")
FreqTbl (ViviextFreq, solomoracred$VIVIEXTRA, "VIVIEXTRA")
FreqTbl (SemoviFreq, solomoracred$SEMOVI, "SEMOVI")
FreqTbl (VehicFreq, solomoracred$VEHICU, "VEHICU")
FreqTbl (MaquiFreq, solomoracred$MAQUI, "MAQUI")
FreqTbl (SegurFreq, solomoracred$SEGUR, "SEGUR")
FreqTbl (CuentahoFreq, solomoracred$CUENTAHOR, "CUENTAHOR")
FreqTbl (MoratarFreq, solomoracred$MORATAR, "MORATAR")
FreqTbl (MoracomFreq, solomoracred$MORACOM, "MORACOM")
FreqTbl (MoralibFreq, solomoracred$MORALIB, "MORALIB")
FreqTbl (MoragFreq, solomoracred$MORAGOT, "MORAGOT")
FreqTbl (MorafiaFreq, solomoracred$MORAFIA, "MORAFIA")
FreqTbl (MoracoFreq, solomoracred$MORACOP, "MORACOP")
FreqTbl (MoraeduFreq, solomoracred$MORAEDU, "MORAEDU")
FreqTbl (MoraparFreq, solomoracred$MORAPARI, "MORAPARI")
FreqTbl (AccionFreq, solomoracred$ACCION, "ACCION")
FreqTbl (SwatfutFreq, solomoracred$SWAFUT, "SWAFUT")
FreqTbl (NivendeFreq, solomoracred$NIVENDE, "NIVENDE")
FreqTbl (NegropFreq, solomoracred$NEGPROP, "NEGPROP")
FreqTbl (FondosFreq, solomoracred$FONDOS, "FONDOS")

#definir base de datos solo con NO mora crédito hipotecario

nosolomoracred <- subset(analyticiefic, MORACRE != 1)
table(nosolomoracred$MORACRE)
nrow(nosolomoracred)

NomoracreFreq <- table(analyticiefic$MORACRE)
NomoracreFreq
write.csv(MoracreFreq, file = "NoMoracre.csv")

FreqTbl <-defmacro(OutputTable, InputVar, CSVTable, 
                   expr={
                     OutputTable <- table(InputVar);
                     write.csv(OutputTable, file = paste0(CSVTable, ".csv"))
                   })

FreqTbl (AnioFreq, nosolomoracred$ANIO, "Anio")
FreqTbl (IngresoFreq, nosolomoracred$INGRESOSTOT, "iNGRESO")
FreqTbl (EducaFreq, nosolomoracred$P10, "EDUCA")
FreqTbl (InstituFreq, nosolomoracred$P2472, "INSTITUCION")
FreqTbl (GastoFreq, nosolomoracred$P2479, "GASTOIN")
FreqTbl (TotalingFreq, nosolomoracred$P2480, "TOTALING")
FreqTbl (CaliftFreq, nosolomoracred$CALIFTOTAL, "CALIFTOTAL")
FreqTbl (CdtFreq, nosolomoracred$CDT, "CDT")
FreqTbl (CondcreFreq, nosolomoracred$CONDCRE, "CONDCRE")
FreqTbl (ElectFreq, nosolomoracred$ELECTROTOT, "ELECTROTOT")
FreqTbl (AlimeFreq, nosolomoracred$ALIME, "ALIME")
FreqTbl (VestuFreq, nosolomoracred$VESTU, "VESTU")
FreqTbl (AguaFreq, nosolomoracred$AGUA, "AGUA")
FreqTbl (LuzFreq, nosolomoracred$LUZ, "LUZ")
FreqTbl (GasFreq, nosolomoracred$GAS, "GAS")
FreqTbl (TelefFreq, nosolomoracred$TELEF, "TELEF")
FreqTbl (SerdoFreq, nosolomoracred$SERDO, "SERDO")
FreqTbl (RecreFreq, nosolomoracred$RECRE, "RECRE")
FreqTbl (SaludFreq, nosolomoracred$SALUD, "SALUD")
FreqTbl (InterFreq, nosolomoracred$INTER, "INTER")
FreqTbl (TransFreq, nosolomoracred$TRANS, "TRANS")
FreqTbl (PemanFreq, nosolomoracred$PEMAN, "PEMAN")
FreqTbl (ViviextFreq, nosolomoracred$VIVIEXTRA, "VIVIEXTRA")
FreqTbl (SemoviFreq, nosolomoracred$SEMOVI, "SEMOVI")
FreqTbl (VehicFreq, nosolomoracred$VEHICU, "VEHICU")
FreqTbl (MaquiFreq, nosolomoracred$MAQUI, "MAQUI")
FreqTbl (SegurFreq, nosolomoracred$SEGUR, "SEGUR")
FreqTbl (CuentahoFreq, nosolomoracred$CUENTAHOR, "CUENTAHOR")
FreqTbl (MoratarFreq, nosolomoracred$MORATAR, "MORATAR")
FreqTbl (MoracomFreq, nosolomoracred$MORACOM, "MORACOM")
FreqTbl (MoralibFreq, nosolomoracred$MORALIB, "MORALIB")
FreqTbl (MoragFreq, nosolomoracred$MORAGOT, "MORAGOT")
FreqTbl (MorafiaFreq, nosolomoracred$MORAFIA, "MORAFIA")
FreqTbl (MoracoFreq, nosolomoracred$MORACOP, "MORACOP")
FreqTbl (MoraeduFreq, nosolomoracred$MORAEDU, "MORAEDU")
FreqTbl (MoraparFreq, nosolomoracred$MORAPARI, "MORAPARI")
FreqTbl (AccionFreq, nosolomoracred$ACCION, "ACCION")
FreqTbl (SwatfutFreq, nosolomoracred$SWAFUT, "SWAFUT")
FreqTbl (NivendeFreq, nosolomoracred$NIVENDE, "NIVENDE")
FreqTbl (NegropFreq, nosolomoracred$NEGPROP, "NEGPROP")
FreqTbl (FondosFreq, nosolomoracred$FONDOS, "FONDOS")

#cargar libreria MASS y realizr el análisis  bivariado de dependecia de las variables con Chicuadrado

library(MASS)

print(str(analyticiefic))

ChiTest <- defmacro(VarName, TblName, expr={
  TblName = table(analyticiefic$MORACRE, analyticiefic$VarName); 
  chisq.test(TblName)})

ChiTest(ANIO, aniotbl)
ChiTest(INGRESOSTOT, ingresosttbl)
ChiTest(P10, nivedutbl)
ChiTest(P2472, sitcretbl)
ChiTest(P2479, gasingtbl)
ChiTest(P2480, gastotingtbl)
ChiTest(CALIFTOTAL, califtbl)
ChiTest(CDT, cdttbl)
ChiTest(CONDCRE, condcretbl)
ChiTest(ELECTROTOT, Electtotbl)
ChiTest(ALIME, Alimetbl)
ChiTest(VESTU, Vestutbl)
ChiTest(AGUA, Aguatbl)
ChiTest(LUZ, Luztbl)
ChiTest(GAS, Gastbl)
ChiTest(TELEF, Teleftbl)
ChiTest(SERDO, Serdotbl)
ChiTest(RECRE, Recretbl)
ChiTest(SALUD, Saludtbl)
ChiTest(INTER, Intertbl)
ChiTest(TRANS, Transtbl)
ChiTest(PEMAN, Pemantbl)
ChiTest(VIVIEXTRA, Viviexttbl)
ChiTest(SEMOVI, Semovitbl)
ChiTest(VEHICU, Vehictbl)
ChiTest(MAQUI, Maquitbl)
ChiTest(SEGUR, Segurtbl)
ChiTest(CUENTAHOR, Cuentahotbl)
ChiTest(MORATAR, Moratartbl)
ChiTest(MORACOM, Moracomtbl)
ChiTest(MORALIB, Moralibtbl)
ChiTest(MORAGOT, Moragtbl)
ChiTest(MORAFIA, Morafiatbl)
ChiTest(MORACOP, Moracotbl)
ChiTest(MORAEDU, Moraedutbl)
ChiTest(MORAPARI, Morapartbl)
ChiTest(ACCION, Acciontbl)
ChiTest(SWAFUT, Swatfuttbl)
ChiTest(NIVENDE, Nivendetbl)
ChiTest(NEGPROP, Negroptbl)
ChiTest(FONDOS, Fondostbl)

# Grafiquemos algunas relaciones

library(ggplot2)

ggplot(analyticiefic, aes(x = ANIO , fill = factor(MORACRE))) +
  geom_bar() +
  xlab("AÑO") +
  ylab("Total") +
  labs(fill = "MORA CRÉDITO") 

ggplot(solomoracred, aes(x = CALIFTOTAL, fill = factor(MORACRE))) +
  geom_bar() +
  xlab("CALIFICACIÓN") +
  ylab("Total") +
  labs(fill = "MORA CRÉDITO") 

ggplot(solomoracred, aes(x = ANIO , fill = factor(MORACRE))) +
  geom_bar() +
  xlab("AÑO") +
  ylab("Total") +
  labs(fill = "MORA CRÉDITO") 

ggplot(solomoracred, aes(x = CALIFTOTAL, fill = factor(MORACRE))) +
  geom_bar() +
  xlab("CALIFICACIÓN") +
  ylab("Total") +
  labs(fill = "MORA CRÉDITO") 

ggplot(analyticiefic, aes(x = P2472, fill = factor(MORACRE))) +
  geom_bar() +
  xlab("INSTITUCIÓN") +
  ylab("Total") +
  labs(fill = "MORA CRÉDITO") 

ggplot(analyticiefic, aes(x = CALIFTOTAL, fill = MORACRE)) +
  stat_count(width = 0.5) +
  facet_wrap(~ANIO) + 
  ggtitle("ANIO") +
  xlab("CALIFTOTAL") +
  ylab("TotaL") +
  labs(fill = "MORACRE")

ggplot(solomoracred, aes(x = CALIFTOTAL, fill = MORACRE)) +
  stat_count(width = 0.5) +
  facet_wrap(~ANIO) + 
  ggtitle("ANIO") +
  xlab("CALIFTOTAL") +
  ylab("TotaL") +
  labs(fill = "MORACRE")

ggplot(analyticiefic, aes(x = INGRESOSTOT, fill = MORACRE)) +
  stat_count(width = 0.5) +
  facet_wrap(~ANIO) + 
  ggtitle("ANIO") +
  xlab("CALIFTOTAL") +
  ylab("TotaL") +
  labs(fill = "MORACRE")

ggplot(analyticiefic, aes(x = CONDCRE, fill = MORACRE)) +
  stat_count(width = 0.5) +
  facet_wrap(~CALIFTOTAL) + 
  ggtitle("ANIO") +
  xlab("CALIFTOTAL") +
  ylab("TotaL") +
  labs(fill = "MORACRE")

mosaicplot(analyticiefic$CALIFTOTAL ~ analyticiefic$MORACRE,
           main="Mora Crédito vs Calificación", color=TRUE,
           xlab="CALIFTOTAL", ylab="MORACRE")

#Comenzamos con el anáisis de Machine Learnig mediante la técnica Random Forest, para ello tomamos las variables estadisticamente
#significativas

#Acabamos de asignar tipo de variable factor a todas las variables

# Comenzamos con las técnicas de Machine Learnig como Random Forest, para determinar la relación entre
# los valores y las variables dependiente de MORACRE, mediante la creación de árboles independientes.

#RANDOM FOREST

library(randomForest)

# Entrenamos nuestra red escogiendo variables y verificando su capacidad predictiva.

rf.train.1 <- analyticiefic[c()]
rf.label <- as.factor(analyticiefic$MORACRE)

set.seed(1234)
rf.1 <- randomForest(x = rf.train.1, y = rf.label, importance = TRUE, ntree = 500)
rf.1
varImpPlot(rf.1)

#segundo entrenamiento

rf.train.2 <- analyticiefic[c("CONDCRE", "P2472", "P2480", "MORATAR", "MORALIB", "MORAFIA", "MORACOP", "MORAPARI", "NIVENDE", "MORAGOT", "MORACOM", "VIVIEXTRA")]
rf.label <- as.factor(analyticiefic$MORACRE)

set.seed(1234)
rf.2 <- randomForest(x = rf.train.2, y = rf.label, importance = TRUE, ntree = 500)
rf.2
varImpPlot(rf.2)

#tercer entrenamiento

rf.train.3 <- analyticiefic[c( "P2472" ,"CONDCRE", "P2480", "MORAFIA", "MORACOP")]
rf.label <- as.factor(analyticiefic$MORACRE)

set.seed(1234)
rf.3 <- randomForest(x = rf.train.3, y = rf.label, importance = TRUE, ntree = 500)
rf.3
varImpPlot(rf.3)

#cuarto entrenamiento 

rf.train.4 <- analyticiefic[c("CONDCRE", "P2472", "P2480", "MORATAR", "MORALIB", "MORAFIA", "MORACOP", "MORAPARI", "NIVENDE", "ALIME")]
rf.label <- as.factor(analyticiefic$MORACRE)

set.seed(1234)
rf.4 <- randomForest(x = rf.train.4, y = rf.label, importance = TRUE, ntree = 500)
rf.4
varImpPlot(rf.4)

# quinto entrenamiento

rf.train.5 <- analyticiefic[c("CONDCRE", "P2472", "P2480", "MORATAR", "MORALIB", "MORAFIA", "MORACOP", "MORAPARI", "NIVENDE", "ALIME", "VIVIEXTRA")]
rf.label <- as.factor(analyticiefic$MORACRE)

set.seed(1234)
rf.5 <- randomForest(x = rf.train.5, y = rf.label, importance = TRUE, ntree = 500)
rf.5
varImpPlot(rf.5)

# Cargamos las librerias necesarias para realizar la validación cruzada o "crossvalidation"

library(randomForest)
library(e1071)
library(plyr)
library(stringi)
library(ggplot2)
library (lattice)
library(caret)
library(doSNOW)
library(xgboost)
library(rpart)
library(rpart.plot)

#CROSS VALIDATION

# creamos un entrenamiento con 10 ,5 Y 3 folds o conjunto de datos con el fin de comparar su exactitud.

set.seed(2348)
cv.10.folds <- createMultiFolds(rf.label, k = 10, times = 10)

# determinamos el método de entrenamiento

ctrl.1 <- trainControl(method = "repeatedcv", number = 10, repeats = 10,
                       index = cv.10.folds)

# realizamos la configuración del entrenamiento en paralelo mediante el paquete doSnow,
# ya que requerimos un procesamiento significativo.

cl <- makeCluster(4, type = "SOCK")
registerDoSNOW(cl)

# ejecutamos el algoritomo de entrenamiento, debemos tener cuidado con la parametrización ya que depende de nuestro
# procesador.

set.seed(34324)
rf.5.cv.1 <- train(x = rf.train.5, y = rf.label, method = "rf", tuneLength = 3,
                   ntree = 500, trControl = ctrl.1)

# apagamos el cluster

stopCluster(cl)

# Chequeamos los resultados

rf.5.cv.1

# Realizamos nuevamente el entrenamiento con K=5
set.seed(2348)
cv.5.folds <- createMultiFolds(rf.label, k = 5, times = 10)

ctrl.2 <- trainControl(method = "repeatedcv", number = 5, repeats = 10,
                       index = cv.5.folds)

cl <- makeCluster(4, type = "SOCK")
registerDoSNOW(cl)

set.seed(34324)
rf.5.cv.2 <- train(x = rf.train.5, y = rf.label, method = "rf", tuneLength = 3,
                   ntree = 500, trControl = ctrl.2)

# apagamos el cluster
stopCluster(cl)

# Chequeamos los resultados
rf.5.cv.2

# Realizamos nuevamente el entrenamiento con K=3

set.seed(2348)
cv.3.folds <- createMultiFolds(rf.label, k = 3, times = 10)

ctrl.3 <- trainControl(method = "repeatedcv", number = 3, repeats = 10,
                       index = cv.3.folds)

cl <- makeCluster(4, type = "SOCK")
registerDoSNOW(cl)

set.seed(34324)
rf.5.cv.3 <- train(x = rf.train.5, y = rf.label, method = "rf", tuneLength = 3,
                   ntree = 64, trControl = ctrl.3)

# apagamos el cluster
stopCluster(cl)

# Chequeamos los resultados
rf.5.cv.3

# nuestro primero modelo arroja los mejore resultados.
# Ahora miremos otra ténica de Machine Learning como lo son los árboles de desición o "Desicion Tree" que 
# se asemeja a Random Forest pero de manera individiual, pero permite una mayor visualización.

# cargamos librerias para paquete de algoritmo y graficación

#DESICION TREE

library(rpart)
library(rpart.plot)

# Creamos la función de utilidad

rpart.cv <- function(seed, training, labels, ctrl) {
  cl <- makeCluster(4, type = "SOCK")
  registerDoSNOW(cl)
  
  set.seed(seed)
  
  # creamos la función de entrenamiento
  
  rpart.cv <- train(x = training, y = labels, method = "rpart", tuneLength = 30, 
                    trControl = ctrl)
  
  # apagamos el cluster
  stopCluster(cl)
  
  return (rpart.cv)
}


# escogemos las variabes a analizar, las cuales ya previamente comprobamos dependencia

features <- c("INGRESOSTOT" ,
              "P10" ,
              "P2472" ,
              "P2479" ,
              "P2480" ,
              "CALIFTOTAL" ,
              "CDT" ,
              "CONDCRE" ,
              "ELECTROTOT" ,
              "ALIME" ,
              "VESTU" ,
              "AGUA" ,
              "LUZ" ,
              "GAS" ,
              "TELEF" ,
              "SERDO" ,
              "RECRE" ,
              "SALUD" ,
              "INTER" ,
              "TRANS" ,
              "PEMAN" ,
              "VIVIEXTRA" ,
              "SEMOVI" ,
              "VEHICU" ,
              "MAQUI" ,
              "SEGUR" ,
              "CUENTAHOR" ,
              "MORATAR" ,
              "MORACOM" ,
              "MORALIB" ,
              "MORAGOT" ,
              "MORAFIA" ,
              "MORACOP" ,
              "MORAEDU" ,
              "MORAPARI" ,
              "ACCION" ,
              "SWAFUT" ,
              "NIVENDE" ,
              "NEGPROP" ,
              "FONDOS" )

rpart.train.1 <- analyticiefic[features]


# corremos el algoritmo

rpart.1.cv.1 <- rpart.cv(94622, rpart.train.1, rf.label, ctrl.1)
rpart.1.cv.1

# graficamos

prp(rpart.1.cv.1$finalModel, type = 0, extra = 2, under = TRUE)

# escogemos otras variables potenciales y comparamos

features2 <- c("INGRESOSTOT" ,
               "P10" ,
               "P2479" ,
               "P2480" ,
               "CALIFTOTAL" ,
               "CDT" ,
               "CONDCRE" ,
               "ELECTROTOT" ,
               "ALIME" ,
               "VESTU" ,
               "AGUA" ,
               "LUZ" ,
               "GAS" ,
               "TELEF" ,
               "SERDO" ,
               "RECRE" ,
               "SALUD" ,
               "INTER" ,
               "TRANS" ,
               "PEMAN" ,
               "VIVIEXTRA" ,
               "SEMOVI" ,
               "VEHICU" ,
               "MAQUI" ,
               "SEGUR" ,
               "CUENTAHOR" ,
               "MORATAR" ,
               "MORACOM" ,
               "MORALIB" ,
               "MORAGOT" ,
               "MORAFIA" ,
               "MORACOP" ,
               "MORAEDU" ,
               "MORAPARI" ,
               "ACCION" ,
               "SWAFUT" ,
               "NIVENDE" ,
               "NEGPROP" ,
               "FONDOS" )

rpart.train.2 <- analyticiefic[features2]


# corremos el algoritmo
rpart.1.cv.2 <- rpart.cv(94622, rpart.train.2, rf.label, ctrl.1)
rpart.1.cv.2

# graficamos
prp(rpart.1.cv.2$finalModel, type = 0, extra = 2, under = TRUE)

#3

features3 <- c("P2480", "MORATAR", "MORALIB", "MORAFIA", "MORACOP", "MORAPARI", "NIVENDE", "ALIME", "VIVIEXTRA")

rpart.train.3 <- analyticiefic[features3]


# corremos el algoritmo
rpart.1.cv.3 <- rpart.cv(94622, rpart.train.3, rf.label, ctrl.1)
rpart.1.cv.3

# graficamos
prp(rpart.1.cv.3$finalModel, type = 0, extra = 2, under = TRUE)

#MUTUAL INFORMATION


# fianlmente como complemento a nuestro análisis verifiquemos mediante la técnica de "Información Mutua" la cual es 
# en teoría de la probabilidad, y en teoría de la información, la información mutua o transinformación de dos 
#variables aleatorias es una cantidad que mide la dependencia mutua de las dos variables, es decir, mide la 
#reducción de la incertidumbre (entropía) de una variable aleatoria, X, debido al conocimiento del valor de 
# otra variable aleatoria Y.1

library(infotheo)

mutinformation(rf.label, analyticiefic$CONDCRE)
mutinformation(rf.label, analyticiefic$P2472)
mutinformation(rf.label, analyticiefic$ALIME)
mutinformation(rf.label, analyticiefic$VESTU)
mutinformation(rf.label, analyticiefic$AGUA)
mutinformation(rf.label, analyticiefic$LUZ)
mutinformation(rf.label, analyticiefic$GAS)
mutinformation(rf.label, analyticiefic$TELEF)
mutinformation(rf.label, analyticiefic$SERDO)
mutinformation(rf.label, analyticiefic$RECRE)
mutinformation(rf.label, analyticiefic$SALUD)
mutinformation(rf.label, analyticiefic$INTER)
mutinformation(rf.label, analyticiefic$TRANS)
mutinformation(rf.label, analyticiefic$PEMAN)
mutinformation(rf.label, analyticiefic$P2479)
mutinformation(rf.label, analyticiefic$CALIFTOTAL)
mutinformation(rf.label, analyticiefic$MORATAR)
mutinformation(rf.label, analyticiefic$MORALIB)
mutinformation(rf.label, analyticiefic$MORAFIA)
mutinformation(rf.label, analyticiefic$MORACOP)
mutinformation(rf.label, analyticiefic$MORAPARI)
mutinformation(rf.label, analyticiefic$NIVENDE)
mutinformation(rf.label, analyticiefic$MORACRE)


#DESICION TREE CON MUTUAL INFORMATION

# escojamos las variable arrojadas y cosntruyamos un nuevo árbol

features4 <- c("CONDCRE",
               "NIVENDE",
               "MORATAR",
               "P2479",
               "MORAPARI",
               "RECRE",
               "MORALIB",
               "MORACOP",
               "MORAFIA",
               "ALIME",
               "PEMAN")

rpart.train.4 <- analyticiefic[features4]

rpart.1.cv.4 <- rpart.cv(94622, rpart.train.4, rf.label, ctrl.1)
rpart.1.cv.4

prp(rpart.1.cv.4$finalModel, type = 0, extra = 2, under = TRUE)

# Comprobamos que es aún mejor el modelo inicial


#BOOSTING

# Para finalizar nuestro análisis en R, miremos el algoritmo de machine Learning XGboost que representa algo similar
# a Randmo Forest pero cada árbol es dependiente del otro aprendiento del error previo, lo que implica mayor tiempo 
# de procesamiento.

# Establecemos 10 folds o particiones y 3 repeticiones

train.control <- trainControl(method = "repeatedcv",
                              number = 10,
                              repeats = 3,
                              search = "grid")

# parametrizamos el algoritmo XGBoost

tune.grid <- expand.grid(eta = c(0.05, 0.075, 0.1),
                         nrounds = c(50, 75, 100),
                         max_depth = 6:8,
                         min_child_weight = c(2.0, 2.25, 2.5),
                         colsample_bytree = c(0.3, 0.4, 0.5),
                         gamma = 0,
                         subsample = 1)
View(tune.grid)


# Al igual que hicimos anteriormente, realizamos un procesamiento en paralelo con la ayuda de doSnow

cl <- makeCluster(4, type = "SOCK")

# Registramos el cluster para que el paquete Caret lo identifique

registerDoSNOW(cl)

# Corremos el algoritmo

caret.cv <- train(MORACRE ~ ., 
                  data = analyticiefic,
                  method = "xgbTree",
                  tuneGrid = tune.grid,
                  trControl = train.control)
stopCluster(cl)


# Examinamos los resultados

caret.cv

#DEEP LEARNING

#inicamos el paquete
library(h2o)
h2o.init()

#fraccionamos la base de datos en 3 para efectos de entrenamiento, validación y pruebas.70% , 15% y 15% respectivamente.

train <- analyticiefic[1:31900,]
valid <- analyticiefic[31901:38300,]
test <- analyticiefic[38301:42658,]

#definimos como catgorias de h2o

train_h2o <- as.h2o(train)
test_h2o <- as.h2o(test)

#establecemos el modelo y lo entrenamos

model <- h2o.deeplearning(y= "MORACRE",
                          training_frame = train_h2o,
                          hidden = c(10,10),
                          seed = 0)

# relizamos las predicciones con "predict" o matrix de confuciones.

preds <- h2o.predict(model,test_h2o)
h2o.confusionMatrix(model,test_h2o)
