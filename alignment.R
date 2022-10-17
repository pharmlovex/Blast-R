# Get the updated version of sangeranalyseR
install.packages("devtools")

library(devtools)

# Download it from the master branch
install_github("roblanf/sangeranalyseR", ref = "master")

# Download it from the develop branch
#install_github("roblanf/sangeranalyseR", ref = "develop")

library(sangeranalyseR)

#Prepare your input files & loading
rawDataDir <- system.file("extdata", package = "sangeranalyseR")
parentDir <- file.path(rawDataDir, 'Allolobophora_chlorotica', 'ACHLO')

#Load and analyse your data

ACHLO_contigs <- SangerAlignment(ABIF_Directory     = parentDir,
                                 REGEX_SuffixForward = "_[0-9]*_F.ab1$",
                                 REGEX_SuffixReverse = "_[0-9]*_R.ab1$")

# Visualise in R shinny app
launchApp(ACHLO_contigs)

# Write the contig to fasta file 


writeFasta(ACHLO_contigs)

# Generate reports
generateReport(ACHLO_contigs)
