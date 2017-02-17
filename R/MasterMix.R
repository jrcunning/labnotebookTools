MasterMix <- function(n=1, assays=NULL) {
  Mc <- list(GTMM=5, McF=0.5, McR=0.5, McP=0.5, H20=2.5)
  Ss <- list(GTMM=5, SsF=0.5, SsR=0.5, SsP=0.5, H20=2.5)
  Of <- list(GTMM=5, OfF=0.5, OfR=0.5, OfP=0.5, H20=2.5)
  Ac <- list(GTMM=5, AcF=0.5, AcR=0.5, AcP=0.5, H20=2.5)
  A  <- list(GTMM=5,  AF=0.5,  AR=0.5,  AP=0.5, H20=2.5)
  B  <- list(GTMM=5,  BF=0.5,  BR=0.5,  BP=0.5, H20=2.5)
  C  <- list(GTMM=5,  CF=0.5,  CR=0.5,  CP=0.5, H20=2.5)
  D  <- list(GTMM=5,  DF=0.5,  DR=0.5,  DP=0.5, H20=2.5)
  CD <- list(GTMM=5,  CF=0.5,  CR=0.5,  CP=0.5, DF=0.5, DR=0.5, DP=0.5, H20=1)

  mix <- sapply(assays, function(x) lapply(get(x), function(x) x * n))
  lapply(mix, data.frame)
}
