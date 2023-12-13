library(here)

source(here('R', 'funcs_qapp.R'))

txt_replace(here('textentry.txt'), here('template_qapp.txt'), here('qapp_completed.txt'))
