## ----eval=FALSE----------------------------------------------------------
#  package.install(jsonlite)

## ----eval=FALSE----------------------------------------------------------
#  
#  library(jsonlite)
#  library(parallel)
#  DIR<-dir()
#  FILES <- DIR[((grep("PigeonPea_", DIR)))]
#  
#  rv<-mclapply((FILES), function(x){
#    S<-fromJSON(x)
#  
#      tryCatch({cbind(query_title=S$BlastOutput2$report$results$search$query_title,
#      evalue=as.numeric(S$BlastOutput2$report$results$search$hits$hsps[[1]]$evalue),
#      title=S$BlastOutput2$report$results$search$hits$description[[1]]$title)}, finally={NULL})
#  }, mc.cores=32)
#  

