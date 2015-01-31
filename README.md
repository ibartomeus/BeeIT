BeeIT
=====

Tools to estimate tongue length, foraging distance and body weight form bees intertegular distances (IT).

This is an alpha release, which means the code is functional, but may suffer changes before final publication. A full package is planed for next fall. If used, please cite Cariveau et al. In prep.

How to use it?
==============
You have to install the package from GitHub. Thats easy:

```
install.packages("devtools")
require(devtools)
install_github("BeeIT", "ibartomeus")
library(BeeIT)
```

Once the package is loaded, its use is pretty simple, it require a vector of intertegular distances (IT) and bee families.

```
#dummy dataset
its <- rnorm(100, 10, 2)
families <- rep(c("Andrenidae", "Apidae", "Colletidae", "Halictidae", "Megachilidae"),20)
Out <- ITconverter(IT = its, family = families)
plot(Out$tongue_length ~ Out$body_mass)
```

You can ask for help
```
?ITconverter
```

Or access the data used to fit the equation:
```
data(tongues)
head(tongues)
?tongues
```

And cite our paper if you use it:
```
citation("BeeIT")
```

Or find the paper here: "Cariveau et al. 2015 ..." [link]

