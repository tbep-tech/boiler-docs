library(here)

source(here('R', 'funcs_icr.R'))

txt_replace(here('textentry_pipeup.txt'), here('template_icr.txt'), here('icr_completed.txt'))
