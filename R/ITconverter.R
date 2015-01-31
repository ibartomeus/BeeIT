#' Converts IT measures to body mass, foraging distance and tongue length for bees.
#' 
#' Calculates body mass form cane (1987), foraging distande from Greenleaf et al. (2007) and 
#' tongue length from Cariveau et al. (2015) using intertegular distance values (IT).  
#' 
#' @param IT A vector of bee intertegular spans (IT) measurments in cm.
#' @param family a vector of bee families. Only implemented 5 out of the extant 7 families: 
#' "Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae".
#' 
#' @return A dataframe with bee body masses (gr), tongue length (mm) and foraging distance 
#' (m) is returned for each bees species.
#'
#' @export
#' 
#' @examples 
#' x <- rnorm(100, 10, 2)
#' f <- rep(c("Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae"),20)
#' y <- ITconverter(IT = x, family = f)
#' plot(log(x)~log(y$body_mass))
#' plot(log(x)~log(y$tongue_length))
#' plot(y$tongue_length ~ y$body_mass)

weigth_fn <- function(IT){exp(0.6453 + 2.4691*log(IT))}
#' @export
#' 


#foraging_fn <- #to be implemented
#' @export
#' 


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
#' @export
#' 



ITconverter <- function(IT,family){  
  data.frame(body_mass = weigth_fn(IT), foraging_distance = NA, 
             tongue_length = tongue_fn(IT, family))
}

#' @export
#' 

