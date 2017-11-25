library("PubMedWordcloud")
library("RColorBrewer")
library("rentrez")

search_year <- function(year, term){
  query <- paste(term, "AND (", year, "[PDAT])")
  entrez_search(db="pubmed", term=query, retmax=10000)
}

terms2012 <- search_year(2012, "machine learning")
# 
terms2015 <- search_year(2015, "machine learning")
# write.csv(terms2015$ids, file = "../data/pubMedIds2015.csv")
terms2016 <- search_year(2016, "machine learning")
# write.csv(terms2016$ids, file = "../data/pubMedIds2016.csv")
terms2017 <- search_year(2017, "machine learning")
# write.csv(terms2017$ids, file = "../data/pubMedIds2017.csv")

# pmid <- getPMIDs(author = author, dFrom = 1900, dTo = 2013, n = 200)
# pmids <- c(terms2015$ids, terms2016$ids, terms2017$ids)


trivial <- c("methods", "models", "several", "using", "used",
             "present", "data", "learning", "approach", "can")

plotPubMedWordCloud <- function(ids) {
  abstracts <- getAbstracts(sample(ids, size = 100))
  words <- cleanAbstracts(abstracts)
  for (w in trivial) {
    words <- words[!words$word == w, ]
  }

  # plotWordCloud(words[], rot.per = 0, colors = brewer.pal(9, "Set1"), scale = 0.5)
  
  plotWordCloud(words, scale = c(3, 0.3), min.freq = 1, max.words = 2000,
                random.order = FALSE, rot.per = 0.35, use.r.layout = FALSE,
                colors = brewer.pal(9, "Set1"))
}


plotPubMedWordCloud(terms2016$ids)

