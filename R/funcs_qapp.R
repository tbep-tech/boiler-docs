# add text under custom headers in template_qapp with text under custom headers in custom
# save file as qapp_completed
txt_replace <- function(textentry_pipeup, template_qapp, qapp_completed){
  
  ##
  # textentry as list
  
  textentry_pipeuplns <- readLines(textentry_pipeup, warn = F)

  textentry_pipeupls <- list()
  textentry_pipeuphd <- NULL
  
  for (line in textentry_pipeuplns) {
    if (startsWith(line, "#")) {
      textentry_pipeuphd <- line
    } else if (!is.null(textentry_pipeuphd)) {
      textentry_pipeupls[[textentry_pipeuphd]] <- paste(textentry_pipeupls[[textentry_pipeuphd]], line, sep = "\n")
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
  
  template_qappls[names(textentry_pipeupls)] <- textentry_pipeupls[names(textentry_pipeupls)]
  
  # collapse to string
  template_qappout <- paste(names(template_qappls), template_qappls, sep = '', collapse = "\n")
  

  writeLines(template_qappout, qapp_completed)
  
  cat("New template_qapp file saved to", qapp_completed, "\n")
  
}