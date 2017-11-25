
if (!("googlesheets" %in% rownames(installed.packages()))) {
  install.packages("googlesheets")
}

library(googlesheets)

gs_ls()

### Get the whole project
paper_tabs <- gs_title("NEW_Paper Table")

# Get the worksheet
paper_dat <- gs_read(ss=paper_tabs, ws = "Full papers data")

# convert to data.frame
df <- as.data.frame(paper_dat)
