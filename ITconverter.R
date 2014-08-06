#Converts IT measures to body mass, foraging distance and tongue length for bees.

# params: 
#IT A vector of bee intertegular spans (IT) measurments in cm
#family: a vector of bee families. Only implemented: "Andrenidae", "Apidae", 
  #"Colletidae", "Halictidae", "Megachilidae".

# return: A dataframe with bee body masses (gr), tongue length (mm) and foraging distance 
  #(m) is returned for each bees species.
 
ITconverter <- function(IT,family){
  weigth_fn <- function(IT){exp(0.6453 + 2.4691*log(IT))}
  #foraging_fn <- #to be implemented
  tongue_fn <- function(IT, family){
    if(!length(IT) == length(family)){
      stop("IT and family should be the same length")
    }
    check_family <- family %in% c("Andrenidae", "Apidae", 
                                  "Colletidae", "Halictidae", "Megachilidae")
    if(any(check_family == FALSE)){
      stop("family should be one of: Andrenidae, Apidae, 
              Colletidae, Halictidae, Megachilidae")
    }
    family_intercepts <- data.frame(families = c("Andrenidae", "Apidae", 
                                                 "Colletidae", "Halictidae", "Megachilidae"),
                                    intercepts = c(0, 0.71917, -0.20601, 0.26755, 0.58148))
    family_intercepts2 <- merge(data.frame(id = c(1:length(family)), families = family), 
                                family_intercepts)
    family_intercepts2 <- family_intercepts2[order(family_intercepts2$id),]
    exp(0.06351+family_intercepts2$intercepts
        + 0.94924*log(IT))  
    }
  data.frame(body_mass = weigth_fn(IT), foraging_distance = NA, 
             tongue_length = tongue_fn(IT, family))
}


#example
x <- rnorm(100, 10, 2)
f <- rep(c("Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae"),20)
y <- ITconverter(IT = x, family = f)
plot(log(x)~log(y$body_mass))
plot(log(x)~log(y$tongue_length))
plot(y$tongue_length ~ y$body_mass)

#The body size conversion is done as per Cane et al. 1987 (Estimation of bee 
  #size using intertegular span (Apoidea). Journal of the Kansas Entomological 
  #Society 60:145–147). The correlation between IT and body mass is 0.96.

#the tongue length converion is done as per Cariveau et al (in prep). 
  #The correlation is 0.90.

