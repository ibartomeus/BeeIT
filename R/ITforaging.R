#' @name ITforaging
#' 
#' @title Converts IT measures to foraging distance for bees.
#' 
#' @description Calculates foraging distande from Greenleaf et al. (2007) using intertegular distance values (IT).  
#' 
#' @param IT A vector of bee intertegular spans (IT) measurments in mm.
#' @param type The type of foraging distance desired. Options are "all", "Maximum homing distance",
#' "Typical homing distance", "Maximum feeder training distance", "Maximum communication distance". See details in Greenleaf et al. 2007.
#' 
#' @return A dataframe with bee and foraging distance (Km) 
#' is returned for each bees species.
#' mhd: Maximum homing distance
#' thd: Typical homing distance
#' mfd: Maximum feeder training distance
#' mcd: Maximum communication distance
#'
#' @examples
#' ITforaging(c(10,5,2))
#' ITforaging(c(10,5,2), type = "Typical homing distance") 
#' 
#' @references Greenleaf, S.S., Williams, N.M., Winfree, R. & Kremen, C. (2007) Bee foraging ranges and their relationship to body size. Oecologia, 153, 589-596.
#'
#' @export
ITforaging <- function(IT, type = "all"){
  if(!type %in% c("all", 
                  "Maximum homing distance", 
                  "Typical homing distance",
                  "Maximum feeder training distance", 
                  "Maximum communication distance")) {
    stop("type should be one of 'all', 'Maximum homing distance', 'Typical homing distance', 'Maximum feeder training distance', 'Maximum communication distance'")
  } else {
    mhd <- 10^((-1.363) + 3.366*log10(IT))  
    thd <- 10^((-1.643) + 3.242*log10(IT))  
    mfd <- 10^((-0.760) + 2.313*log10(IT))  
    mcd <- 10^((-0.993) + 2.788*log10(IT))  
    if (type == "all") out <- cbind(mhd, thd, mfd, mcd)
    if (type == "Maximum homing distance") out <- mhd
    if (type == "Typical homing distance") out <- thd
    if (type == "Maximum feeder training distance") out <- mfd
    if (type == "Maximum communication distance") out <- mcd
    out
  }
}
