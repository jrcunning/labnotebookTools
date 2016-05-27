labnb_entry <- function(title = "new post", serve = FALSE, dir = "_source", subdir = TRUE) {

  if(!dir.exists(dir)){
    stop("The directory '", dir, "' doesn't exist. Are you running R in
         the right directory?")
  }

  # Sanitise the post title
  fname <- gsub(paste0("-", "$|^", "-"), "", gsub(paste0("-", "+"), "-", gsub("[[:space:]]|[[:punct:]]", "-", tolower(title))))

  if(subdir){
    fpath <- file.path(dir, fname)
    dir.create(fpath)
  } else {
    fpath <- dir
  }

  rmd_name <- file.path(fpath, paste0(Sys.Date(), "-", fname, ".Rmd"))
  #r_name   <- file.path(fpath, paste0(fname, ".R"))

  # Read in the skeleton post
  # If it doesn't exist, emit a warning and use the package default
  post <- readLines("skeleton_post.Rmd")
  post[grepl("title: ", post)] <- paste0("title:  ", title)
  writeLines(post, rmd_name)

  # Write out an empty R file as well, in case that's useful
  #writeLines(
  #  c("# This R file accomanies the .Rmd blog post", paste("#", rmd_name), ""),
  #  r_name
  #)

  #sys_open(r_name)
  sys_open(rmd_name)

  if(serve) {
    labnb_serve(serve=T)
  } else {
    labnb_serve(serve=F)
  }
}

