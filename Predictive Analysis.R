#Comenzamos con el anáisis de Machine Learnig mediante la técnica Random Forest, para ello tomamos las variables estadisticamente
#significativas

#Acabamos de asignar tipo de variable factor a todas las variables

# Comenzamos con las técnicas de Machine Learnig como Random Forest, para determinar la relación entre
# los valores y las variables dependiente de MORACRE, mediante la creación de árboles independientes.

#RANDOM FOREST

# Leemos la base de datos escrita

analyticiefic <- read.csv(file="C:/Users/Esteban/Desktop/Tesis MBA/analyticiefic.csv", header=TRUE, sep=",")

View(analyticiefic)

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
