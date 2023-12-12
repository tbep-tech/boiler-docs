library(here)

source(here('R', 'funcs.R'))

txt_replace(here('custom.txt'), here('boiler.txt'), here('new_boiler.txt'))