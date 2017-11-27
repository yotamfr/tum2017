
### https://www.r-bloggers.com/reading-data-from-google-sheets-into-r/

if (!("googlesheets" %in% rownames(installed.packages()))) {
  install.packages("googlesheets")
}

library(googlesheets)
library(data.table)

gs_ls()

# Get the whole project
paper_tabs <- gs_title("NEW_Paper Table")
how_to_tabs <- gs_title("Paper_Table_How_to")

# Get the worksheet
paper_dat <- gs_read(ss=paper_tabs, ws = "Full papers data")
how_to_dat <- gs_read(ss=how_to_tabs, ws="Tabellenblatt1")

# Convert to data.frame
papers <- as.data.frame(paper_dat)
how_to <- as.data.frame(how_to_dat)

df <- df[papers$`name #1` == "Yotam", ]

df[1, "Paper Name"] <- "Network anatomy and in vivo physiology of visual cortical neurons"
df[1, "Paper Link"] <- "https://www.nature.com/articles/nature09802"
df[1, "Field"] <- "Neuroscience"

df[2, "Paper Name"] <- "Matrix eQTL: ultra fast eQTL analysis via large matrix operations"
df[2, "Paper Link"] <- "https://academic.oup.com/bioinformatics/article/28/10/1353/213326"
df[2, "Field"] <- "Bioinformatics"
