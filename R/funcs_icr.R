# add text under custom headers in template_icr with text under custom headers in custom
# save file as icr_completed
txt_replace <- function(textentry, template_icr, icr_completed){
  
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
  # template_icr as list
  
  template_icrlns <- readLines(template_icr, warn = F)
  
  template_icrls <- list()
  template_icrhd <- NULL
  
  for (line in template_icrlns) {
    if (startsWith(line, "#")) {
      template_icrhd <- line
    } else if (!is.null(template_icrhd)) {
      template_icrls[[template_icrhd]] <- paste(template_icrls[[template_icrhd]], line, sep = "\n")
    }
  }
  
  ##
  # replace template_icr textentry with textentry and save
  
  template_icrls[names(textentry_pipeupls)] <- textentry_pipeupls[names(textentry_pipeupls)]
  
  # collapse to string
  template_icrout <- paste(names(template_icrls), template_icrls, sep = '', collapse = "\n")
  
  # replace text if replace not null
  if(!is.null(replace_sing))
    template_icrout <- gsub('<<replace_sing>>', replace_sing, template_icrout)
  # replace text if replace not null
  if(!is.null(replace_plur))
    template_icrout <- gsub('<<replace_plur>>', replace_plur, template_icrout)
  
  writeLines(template_icrout, icr_completed)
  
  cat("New template_icr file saved to", icr_completed, "\n")
  
}