# ISCB2017 - Workshop for Proteomics Data Analysis and Bioinformatics ([p2364](http://fgcz-bfabric.uzh.ch/bfabric/userlab/show-project.html?projectId=2364))

This R package contains data and vignette files for 
a Pigeon Pea (Cajanus cajan) project from 
a [Indo-Swiss Collaboration in Biotechnology](iscb.epfl.ch/iscb/home) (ISCB)
training course on proteome informatics given 
from January 21th to January 25th  2017 at the
[National Research Centre on Plant Biotechnology](http://www.nrcpb.res.in/) (NRCPB) in New Delhi-110012 by 
[JG](http://www.fgcz.ch/the-center/people/grossmann.html), 
[WEW](http://www.fgcz.ch/the-center/people/wolski.html), and 
[CP](http://www.fgcz.ch/the-center/people/panse.html).

# Overview of the week

## Day 1 (Common Day)

- Morning Session: Responsible SE -> Ingrid & Urs
- Afternoon Session: Responsible PrXIT -> Jonas


## Day 2 (Protein Identifications)

Module Number | Theoretical Part | Hands-on Module | Duration | Main responsible Person
------------ |------------ | ------------- | ------------- | ------------- 
1 | Outline for this week | break | 0.5 h | jg 
2 | The FGCZ in Zurich | browse FGCZ page | 0.5 h | jg
3 | Mass spectrometry (and protein analytics) | browse around for milestones in MS, form groups, introduce yourself and your task | 1 h | jg 
4 | Getting ready for hands-on sessions | Install MQ, do git co, commits, get R packages | 1 h | CP
5 | [PSM identification with protViz](vignettes/peakplot.Rmd) | [get fasta, R (seqinR), R (digest), theoretical considerations about search space, different DBs, uniqueness of peptides.](vignettes/peakplot.Rmd)  | 2.5h | CP 
6 | Protein identification VALIDATION with target-decoy strategy | [FDR](vignettes/fdr.Rmd)  | 2h | WEW 
7 | Start your own MQ | run it on your PC | 1h | jg
8 | Conclusion of day 1 | Q & A | 1h | all



## Day 3 (Protein Quantification)

Module Number | Theoretical Part | Hands-on Module | Duration | Main responsible Person
------------ |------------ | ------------- | ------------- | ------------- 
1 | Repetition of Day 1 | Q & A | 0.5 h | all
2 | About Plots | coffee break | 0.5 h | JG
3 | Protein, Peptide, Mass-spec view and LFQ  | [hands-on LFQ](vignettes/lfq.Rmd) | 3h | JG/CP
4 | Experimental design in quant experiments | Looking at annotation of samples in Bfabric | 1h | jg
5 | Two group analysis for Yeast, grown on different nutrient sources | Analysing 2 groups in R-quantable | 2h | WEW
6 & 7 | Principle of ORA and Webtools for model organisms |  Webgestalt, StringDB, YeastCyc w YEAST results | 2h | cpNjg 
8 | Conclusion of day 2 | Q & A | 1h | jg 

## Day 4 -> Republican Day

## Day 5 -> Look at Pigeon Pea and Wrap up of the whole course -> identify room for improvements ;)

Module Number | Theoretical Part | Hands-on Module | Duration | Main responsible Person
------------ |------------ | ------------- | ------------- | ------------- 
1 | Repetition of Day 3 | Q & A | 0.5 h | all
2 | fun with | R, [CRAN](https://cran.r-project.org/) & [Bioconductor](http://bioconductor.org/) | 1.5 h | CP/WEW
3 | blast |  | 0.3 h | CP
4 | Look at the Pigeon Pea project | Make use of what we learnt in the pigeon pea project | 3h | all
5 | Wrap up of the course | Course Evaluation | 1h | all
 


### additionally if we have too much time ;)
- Quantitative proteomics strategies (an overview) | break | 1h | jg | Combo-course day4 (NSK) (show 12)
- Label-free quantification | MQ: txt-tables | 1h | jg | Combo-course day4 (partI) (show 13) 
- YeastData: RNASeq vs PrX: Number crunch | Shiny-app | jg | 1h



## Organisational issues:

### Student should bring:
- own laptop (Windows or Mac/Linux w Virtual Box and Windows instance)
- equiped with: Editor (vi, nano, ..), R., RStudio, git
- some free space (20gigs at least)

## Bfabric Project
http://fgcz-bfabric.uzh.ch/bfabric/userlab/show-project.html?projectId=2364


## Publications to study (upfront)
- Review (Aebersold n Mann) -> https://www.ncbi.nlm.nih.gov/pubmed/27629641
- MQ -> https://www.ncbi.nlm.nih.gov/pubmed/24942700
- LFQ -> https://www.ncbi.nlm.nih.gov/pubmed/23391308
- MSQC1 -> https://www.ncbi.nlm.nih.gov/pubmed/27130639
- Top3 Protein quantification -> https://www.ncbi.nlm.nih.gov/pubmed/20576481

# Howtos

## install the ISCB2017 R package

```{r}
install.packages('devtools')
library(devtools)
install_git('https://github.com/fgcz/ISCB2017', build_vignettes = TRUE, quiet = FALSE)
```

## build the ISCB2017 R package

```{r}
roxygen2::roxygenise()
```


## read the vignettes

```{r}
# get an overview 
library(ISCB)

vignette(package="ISCB2017")
vignette('peakplot')
vignette('fdr')
vignette('lfq')
```
# Notes by CP

## References for R

- [An Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf)
- Visualizing data, William S. Cleveland, Murray Hill, New Jersey : AT&T Bell Laboratories 1993
- Lattice, Multivariate Data Visualization with R, Deepayan Sarkar , 2008
- Volcano Plot -> https://www.ncbi.nlm.nih.gov/pubmed/27272648


