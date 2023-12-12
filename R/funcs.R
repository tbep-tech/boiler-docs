# add text under custom headers in boiler with text under custom headers in custom
# save file as new_boiler
txt_replace <- function(custom, boiler, new_boiler){
  
  ##
  # custom as list
  
  customlns <- readLines(custom, warn = F)

  customls <- list()
  customhd <- NULL
  
  for (line in customlns) {
    if (startsWith(line, "#")) {
      customhd <- line
    } else if (!is.null(customhd)) {
      customls[[customhd]] <- paste(customls[[customhd]], line, sep = "\n")
    }
  }
  
  ##
  # boiler as list
  
  boilerlns <- readLines(boiler, warn = F)
  
  boilerls <- list()
  boilerhd <- NULL
  
  for (line in boilerlns) {
    if (startsWith(line, "#")) {
      boilerhd <- line
    } else if (!is.null(boilerhd)) {
      boilerls[[boilerhd]] <- paste(boilerls[[boilerhd]], line, sep = "\n")
    }
  }
  
  ##
  # replace boiler custom with custom and save
  
  boilerls[names(customls)] <- customls[names(customls)]
  
  # collapse to string
  boilerout <- paste(names(boilerls), boilerls, sep = '', collapse = "\n")
  
  writeLines(boilerout, new_boiler)
  
  cat("New boiler file saved to", new_boiler, "\n")
  
}