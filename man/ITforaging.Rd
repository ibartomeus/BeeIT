% Generated by roxygen2 (4.1.0.9001): do not edit by hand
% Please edit documentation in R/ITforaging.R
\name{ITforaging}
\alias{ITforaging}
\title{Converts IT measures to foraging distance for bees.}
\usage{
ITforaging(IT, type = "all")
}
\arguments{
\item{IT}{A vector of bee intertegular spans (IT) measurments in cm.}

\item{type}{The type of foraging distance desired. Options are "all", "Maximum homing distance",
"Typical homing distance", "Maximum feeder training distance", "Maximum communication distance". See details in Greenleaf et al. 2007.}
}
\value{
A dataframe with bee and foraging distance (Km)
is returned for each bees species.
mhd: Maximum homing distance
thd: Typical homing distance
mfd: Maximum feeder training distance
mcd: Maximum communication distance
}
\description{
Calculates foraging distande from Greenleaf et al. (2007) using intertegular distance values (IT).
}
\examples{
ITforaging(c(10,5,2))
ITforaging(c(10,5,2), type = "Typical homing distance")
}
\references{
Greenleaf, S.S., Williams, N.M., Winfree, R. & Kremen, C. (2007) Bee foraging ranges and their relationship to body size. Oecologia, 153, 589-596.
}

