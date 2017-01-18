#R

.onAttach <- function(lib, pkg){
	if(interactive()){
		version <- packageVersion('ISCB2017')
		packageStartupMessage("Package 'ISCB2017' version ", version)
		# packageStartupMessage("Type 'citation(\"recmap\")' for citing this R package in publications.")
	  invisible()
	}
}
