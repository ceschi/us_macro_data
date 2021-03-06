#### Main code caller for building and 
#### maintaining a db on main real-time,
#### revised and expectational macro indicators
#### of the US economy.

#### Flagging
# make this interactive at the beginning of the 
# script, maybe

# 0 -- the code runs entirely, all different parts composed
# 1 -- when files are run singularily
flag___singular = 0

# 0 -- the code prints out all graphs
# 1 -- graphs are not printed but only produced and stocked
flag___plot = 1

# load minimal libs
if (!require(tictoc)){install.packages('tictoc')}
library(tictoc)


#### DATA COLLECTION, SCRAPING, MANIPULATION ###################################
# US Data
# pick ahead to set how many quarters ahead 
# to consider for SPF forecasts:
# -1 for previous quarter estimates
# 0 for nowcast
# 1 for one quarter ahead -- default
# 2 for two quarters ahead
# 3 for three quarters ahead
# 4 for one year ahead

# !!!! - internalise multiple horizons
tic('Whole process')
tic('Data collection')
ahead <- 1
source("USdata_coll.R", verbose=F, echo=F)
toc()

##### FRED-MQD #################################################################
tic('Data from MD & QD')
source('fred_m_q_d.R', verbose = F, echo = F)
toc()


##### VISUALIZATION ############################################################
tic('Visuals')
source('visuals.R', verbose=F, echo=F)
toc()
toc()


# housekeeping
rm(temp_dir, data_dir, graphs_dir, 
   working_directory, flag___singular,
   flag___plot, ahead)