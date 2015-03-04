#' @name ITweigth
#' 
#' @title Converts IT measures to body mass for bees.
#' 
#' @description Calculates body mass form cane (1987), using intertegular distance values (IT).  
#' 
#' @param IT A vector of bee intertegular spans (IT) measurments in cm.
#' 
#' @return A dataframe with bee body masses (gr) is returned for each bees species.
#'
#' @export
ITweigth <- function(IT){exp(0.6453 + 2.4691*log(IT))}
#'
#' @examples
#' ITweigth(c(10,5,2))
#' @references Cane, J. (1987) Estimation of bee size using intertegular span (Apoidea). Journal of the Kansas Entomological Society, 60, 145-147.