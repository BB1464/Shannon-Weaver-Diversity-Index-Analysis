####################################
# Use data from R package ccChooser
####################################
#install.packages('EvaluateCore')
#install.packages('ccChooser')


# EvaluateCore package to perform shannon-Weaver Diversity Index --------

library(EvaluateCore)  


# ccChooser Package is to get the demo dataset ----------------------------


library(ccChooser)     


data("dactylis_CC")
data("dactylis_EC")


ec <- cbind(genotypes = rownames(dactylis_EC), dactylis_EC[, -1])
ec$genotypes <- as.character(ec$genotypes)
rownames(ec) <- NULL
ec[, c("X1", "X6", "X7")] <- lapply(ec[, c("X1", "X6", "X7")],
                                    function(x) cut(x, breaks = 4))
ec[, c("X1", "X6", "X7")] <- lapply(ec[, c("X1", "X6", "X7")],
                                    function(x) factor(as.numeric(x)))

head(ec)

core <- rownames(dactylis_CC)

quant <- c("X2", "X3", "X4", "X5", "X8")
qual <- c("X1", "X6", "X7")

####################################
# EvaluateCore for Shannon-Weaver Diversity Index
####################################

?shannon.evaluate.core # Refernce Manual


shannon.evaluate.core(data = ec, names = "genotypes",
                      qualitative = qual, selected = core)




