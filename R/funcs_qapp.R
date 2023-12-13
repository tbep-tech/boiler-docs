# add text under custom headers in template_qapp with text under custom headers in custom
# save file as qapp_completed
txt_replace <- function(textentry, template_qapp, qapp_completed){
  
  ##
  # textentry as list
  
  textentrylns <- readLines(textentry, warn = F)

  textentryls <- list()
  textentryhd <- NULL
  
  for (line in textentrylns) {
    if (startsWith(line, "#")) {
      textentryhd <- line
    } else if (!is.null(textentryhd)) {
      textentryls[[textentryhd]] <- paste(textentryls[[textentryhd]], line, sep = "\n")
    }
  }
  
  ##
  # template_qapp as list
  
  template_qapplns <- readLines(template_qapp, warn = F)
  
  template_qappls <- list()
  template_qapphd <- NULL
  
  for (line in template_qapplns) {
    if (startsWith(line, "#")) {
      template_qapphd <- line
    } else if (!is.null(template_qapphd)) {
      template_qappls[[template_qapphd]] <- paste(template_qappls[[template_qapphd]], line, sep = "\n")
    }
  }
  
  ##
  # replace template_qapp textentry with textentry and save
  
  template_qappls[names(textentryls)] <- textentryls[names(textentryls)]
  
  # collapse to string
  template_qappout <- paste(names(template_qappls), template_qappls, sep = '', collapse = "\n")
  
  # replace text if replace not null
  if(!is.null(replace_sing))
    template_qappout <- gsub('<<replace_sing>>', replace_sing, template_qappout)
  # replace text if replace not null
  if(!is.null(replace_plur))
    template_qappout <- gsub('<<replace_plur>>', replace_plur, template_qappout)
  
  writeLines(template_qappout, qapp_completed)
  
  cat("New template_qapp file saved to", qapp_completed, "\n")
  
}