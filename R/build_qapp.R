library(here)

source(here('R', 'funcs_qapp.R'))

txt_replace(here('textentry_pipeup.txt'), here('template_qapp.txt'), here('qapp_completed.txt'))
