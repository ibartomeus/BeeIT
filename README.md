BeeIT
=====

Tools to estimate tongue length, foraging distance and body weight form bees intertegular distances (IT).

This is an alpha release, which means the code is functional, but may suffer changes before final publication. A full package is planed for next fall. If used, please cite Cariveau et al. In prep.

How to use it?
==============
At this stage you can to get the code from GitHub. You can either copy paste the `ITconverter.R` file into R or you can source it by copying the following code (you need to install `RCurl` library):

```
source_github <- function(u) {
    # load package
    library(RCurl)
    
    # read script lines from website
    script <- getURL(u, ssl.verifypeer = FALSE)
    
    # parase lines and evealuate in the global environement
    eval(parse(text = script))
}

source_github("https://raw.githubusercontent.com/ibartomeus/BeeIT/master/ITconverter.R")
```

Once the function is loaded, its use is pretty simple, it require a vector of intertegular distances (IT) and bee families.

```
its <- rnorm(100, 10, 2)
families <- rep(c("Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae"),20)
Out <- ITconverter(IT = its, family = families)
plot(Out$tongue_length ~ Out$body_mass)
```

Correlations of IT with body size (0.96; Cane 1987) and of IT and family with tongue size are high (0.90). 

Better and nicer code comming soon! 
