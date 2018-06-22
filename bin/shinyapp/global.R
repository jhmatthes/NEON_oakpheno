# Load NEON Oak Phenology data from
# Harvard Forest, Ordway Swisher Biological Station, and 
# the San Joaquin Experimental Range

# Load data
oak_phe <- read.csv("data/oak_phenology_sites.csv", header=TRUE)
oak_phe$date <- as.Date(oak_phe$date)

# Get unique phenophases for menu
phenophases <- unique(oak_phe$phenophaseName)[1:6]
