#' @name ITconverter
#' 
#' @title Converts IT measures to body mass, foraging distance and tongue length for bees.
#' 
#' @description Calculates body mass form cane (1987), foraging distande from Greenleaf et al. (2007) and 
#' tongue length from Cariveau et al. (2015) using intertegular distance values (IT).  
#' 
#' @param IT A vector of bee intertegular spans (IT) measurments in cm.
#' @param family a vector of bee families. Only implemented 5 out of the extant 7 families: 
#' "Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae".
#' @param type The type of foraging distance desired. Options are "all", "Maximum homing distance",
#' "Typical homing distance", "Maximum feeder training distance", "Maximum communication distance". See details in Greenleaf et al. 2007.
#' @param mouthpart The mouthpart you are interested in. Options are "all", glossa", "prementum" and "tongue" (i.e. gloss + prementum)
#' 
#' @return A dataframe with bee body masses (gr), tongue length (mm) and foraging distance 
#' (km) is returned for each bees species.
#'
#' 
ITconverter <- function(IT,family, type = "all", mouthpart = "all"){  
  data.frame(body_mass = ITweigth(IT = IT), 
             foraging_distance = ITforaging(IT = IT, type = type), 
             tongue_length = ITtongue(IT = IT, family = family, mouthpart = mouthpart))
  }

#' @examples 
#' it <- rnorm(100, 10, 2)
#' f <- rep(c("Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae"),20)
#' y <- ITconverter(IT = it, family = f)
#' head(y)
#' plot(log(it)~log(y$body_mass))
#' plot(log(it)~log(y$tongue_length.tongue_f))
#' plot(y$tongue_length.tongue_f ~ y$body_mass)
#' ITconverter(IT = head(it), family = head(f), type = "Typical homing distance", mouthpart = "tongue")
#' 
#' @references
#' Cariveau, Nayak, Bartomeus, Zientek, Ascher, Winfree (2015) The allometry of bee tongue length an its uses in ecology and evolution 
#' Greenleaf, S.S., Williams, N.M., Winfree, R. & Kremen, C. (2007) Bee foraging ranges and their relationship to body size. Oecologia, 153, 589-596.
#' Cane, J. (1987) Estimation of bee size using intertegular span (Apoidea). Journal of the Kansas Entomological Society, 60, 145-147.
#' @export






