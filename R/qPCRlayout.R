qPCRlayout <- function(samples=1:24, targets=c("Mc", "CD"), start=c(1,1)) {
  blanks <- (start[1]*start[2]) - 1
  sreps <- rep(samples, each=2*length(targets))
  sreps <- c(rep(NA, blanks), sreps)
  if (length(sreps) > 96) sreps <- sreps[1:96]
  s <- matrix(samples, nrow=8, byrow=F)
  s <- matrix(apply(s, 2, function(x) rep(x,2*length(targets))), nrow=8)
  treps <- rep(rep(targets, each=2), length(samples))
  treps <- c(rep(NA, blanks), treps)
  if (length(treps) > 96) treps <- treps[1:96]
  t <- matrix(treps, nrow=8, byrow=T)
  df <- data.frame(matrix(paste(t(t), '/', t(s)), nrow=8, byrow=T))
  colnames(df) <- seq(1,12,1)[1:ncol(df)]
  rownames(df) <- LETTERS[1:8]
  return(df)
}
