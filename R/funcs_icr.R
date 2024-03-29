# add text under custom headers in template_icr with text under custom headers in custom
# save file as icr_completed
txt_replace <- function(textentry_pipeup, template_icr, icr_completed){
  
  ##
  # textentry as list
  
  textentry_pipeuplns <- readLines(textentry_pipeup, warn = F)

  textentry_pipeupls <- list()
  textentry_pipeuphd <- NULL
  
  for (line in textentry_pipeuplns) {
    if (grepl("^#|^~", line)) {
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
    if (grepl("^#|^~", line)) {
      template_icrhd <- line
    } else if (!is.null(template_icrhd)) {
      template_icrls[[template_icrhd]] <- paste(template_icrls[[template_icrhd]], line, sep = "\n")
    }
  }

  ## 
  # subset textentry_pipeupls to only custom headers in template_icrls

  textentry_pipeupls <- textentry_pipeupls[names(textentry_pipeupls) %in% names(template_icrls)]
  
  ##
  # replace template_icr textentry with textentry and save

  template_icrls[names(textentry_pipeupls)] <- textentry_pipeupls[names(textentry_pipeupls)]
  
  # collapse to string
  template_icrout <- paste(names(template_icrls), template_icrls, sep = '', collapse = "\n")
  
  writeLines(template_icrout, icr_completed)
  
  cat("New template_icr file saved to", icr_completed, "\n")
  
}