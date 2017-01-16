#R

.byIon <- function(b, y){
  Hydrogen <- 1.007825
  Oxygen <- 15.994915
  Nitrogen <- 14.003074
  
  yo <- y - Oxygen - Hydrogen - Hydrogen
  
  c <- b + (Nitrogen + (3 * Hydrogen))
  z <- y - (Nitrogen + (3 * Hydrogen))
  
  c2_ <- (c + Hydrogen) * 0.5
  z2_ <- (z + Hydrogen) * 0.5
  
  b2_ <- (b + Hydrogen) * 0.5
  y2_ <- (y + Hydrogen) * 0.5
  
  return(cbind(b, y, b2_, y2_))#, c, z, c2_, z2_, yo))
}


#' Title
#'
#' @param x a mass spectrometric measurement
#' @param peptideSequence digested, e.g. tryptic, peptide sequnences, sorted according to the parent ion mass
#' @param pimIdx parent ion mass index
#' @param peptideMassTolerancePPM 
#' @param framentIonMassToleranceDa 
#' @param FUN 
#'
#' @return a data.frame
#' @export
#'
#' @examples
peptide_identification <- function(x,
                                   peptideSequence,
                                   pimIdx = parentIonMass(peptideSequence),
                                   peptideMassTolerancePPM = 5,
                                   framentIonMassToleranceDa = 0.01,
                                   FUN=.byIon) {
  
  query.mass <-
    ((x$pepmass  * x$charge))  - (1.007825 * (x$charge - 1))
  eps <- query.mass * peptideMassTolerancePPM * 1E-6
  
  lower <- findNN(query.mass - eps, pimIdx)
  upper <- findNN(query.mass + eps, pimIdx)
  
  rv <- lapply(peptideSequence[lower:upper], function(p) {
    psm(p, x, plot = FALSE, FUN = FUN)
  })
  
  rv.error <-
    sapply(rv, function(p) {
      sum(abs(p$mZ.Da.error) < framentIonMassToleranceDa)
    })
  
  idx.tophit <- which(rv.error == max(rv.error))[1]
  
  data.frame(
    mass_error = eps,
    idxDiff = upper - lower,
    charge = x$charge,
    pepmass = query.mass,
    peptideSequence = rv[[idx.tophit]]$sequence,
    groundTrue.peptideSequence = x$peptideSequence,
    ms2hit = (rv[[idx.tophit]]$sequence == x$peptideSequence),
    hit = (x$peptideSequence %in% peptideSequence[lower:upper])
  )
}
