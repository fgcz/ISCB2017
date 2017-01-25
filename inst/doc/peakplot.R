## ----eval=FALSE----------------------------------------------------------
#  install.packages('protViz')

## ----eval=FALSE----------------------------------------------------------
#  # urlget
#  install.packages('ISCB2017')

## ----echo=TRUE-----------------------------------------------------------
library(ISCB2017)

## ------------------------------------------------------------------------
AA

## ------------------------------------------------------------------------
peptideMassTolerancePPM <- c(1, 5, 10, 20, 50)

## ------------------------------------------------------------------------
eps <- 1000 * peptideMassTolerancePPM * 1E-06

## ----fig.retina=3--------------------------------------------------------
library(ISCB2017)
pim <- parentIonMass(swissprot_tryptic_peptides10K)
hist(pim)

massTolDa <- c(1E-4, 1E-3, 1E-2, 1E-1, 1, 3)
rv.Da <- lapply(massTolDa, function(eps){
  q <- runif(1000, 300,6000)
  lower <- findNN_(q - eps, pim)
  upper <- findNN_(q + eps, pim)

  data.frame(massTol = eps, n = 1 + upper-lower)
  
})


massTolPPM <- c(1, 5, 10, 20, 50)
rv.PPM <- lapply(massTolPPM, function(peptideMassTolerancePPM){
  query.mass <- runif(1000, 300,6000)
  eps <- query.mass * peptideMassTolerancePPM * 1E-06
  

  lower <- findNN_(query.mass - eps, pim)
  upper <- findNN_(query.mass + eps, pim)
  
  data.frame(massTolPPM = peptideMassTolerancePPM, n = 1 +upper - lower)
})

op <- par(mfrow=c(1,2))
boxplot(n ~ massTol,log='y', 
  data=do.call('rbind', rv.Da), 
  xlab='mass tolerance [in Da]',
  ylim=c(1,2E+5),
  ylab='number of tryptic SP peptides mass range [300,6000]')

boxplot(n ~ massTolPPM, log='y', 
  data=do.call('rbind', rv.PPM),
  xlab='mass tolerance [in ppm]',
  ylim=c(1,2E+5),
  ylab='number of tryptic SP pepitdes mass range [300,6000]')

## ------------------------------------------------------------------------
byIon <- function(b, y){
    Hydrogen <- 1.007825
    Oxygen <- 15.994915
    Nitrogen <- 14.003074

    yo <- y - Oxygen - Hydrogen - Hydrogen
    
    c <- b + (Nitrogen + (3 * Hydrogen))
    z <- y - (Nitrogen + (3 * Hydrogen))
  
    # ionMass <- (ionMass + Hydrogen * (charge - 1)) / charge
    c2_ <- (c + Hydrogen) * 0.5
    z2_ <- (z + Hydrogen) * 0.5
  
    b2_ <- (b + Hydrogen) * 0.5
    y2_ <- (y + Hydrogen) * 0.5

    return(cbind(b, y, b2_, y2_))#, c, z, c2_, z2_, yo))
}

## ------------------------------------------------------------------------
fragmentIon('TAFDEAIAELDTLNEESYK', FUN=byIon)

## ------------------------------------------------------------------------
# Label tandem MS for protViz
data(msms)
plot(msms[[1]]$mZ, msms[[1]]$intensity, type='h')

# Compute a peptide spectrum match 
psm("TAFDEAIAELDTLNEESYK", msms[[1]])

## ----fig.retina=3--------------------------------------------------------
rv <- peakplot("TAFDEAIAELDTLNEESYK", msms[[1]])

## ----fig.retina=3--------------------------------------------------------
rv <- peakplot("TAFDEAIAELDTLSEESYK", msms[[2]])


#peakplot(peptide=F161375[[160]]$peptideSequence, 
#         spec=F161375[[160]],
#         FUN=function(b,y){
#           return (list(y=y))
#         })

## ------------------------------------------------------------------------



peptide_identification



idx <- which(sapply(F244088f, function(x) {
length(x$mZ) > 0
}))

S <- do.call('rbind', lapply(F244088f[idx], function(x) {
  peptide_identification(
    x,
    swissprot_tryptic_peptides10K,
    pim,
    peptideMassTolerancePPM = 14,
    FUN = byIon
  )
}))

library(knitr)
kable(S)

