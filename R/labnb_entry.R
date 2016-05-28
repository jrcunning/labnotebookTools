labnb_entry <- function(title = "new post", serve = FALSE, dir = "_source", subdir = TRUE) {

  if(!dir.exists(dir)){
    stop("The directory '", dir, "' doesn't exist. Are you running R in
         the right directory?")
  }

  # Sanitise the post title
  fname <- gsub(paste0("-", "$|^", "-"), "", gsub(paste0("-", "+"), "-", gsub("[[:space:]]|[[:punct:]]", "-", tolower(title))))

  if(subdir){
    fpath <- file.path(dir, paste0(Sys.Date(), "-", fname))
    dir.create(fpath)
  } else {
    fpath <- dir
  }

  rmd_name <- file.path(fpath, paste0(Sys.Date(), "-", fname, ".Rmd"))

  # Read in the skeleton post
  post <- readLines("skeleton_post.Rmd")
  post[grepl("title: ", post)] <- paste0("title:  ", title)
  post[grepl("date: ", post)] <- paste0("date:  ", Sys.time())
  writeLines(post, rmd_name)

  system(paste("open", rmd_name, sep=" "))

  if(serve) {
    labnb_serve(serve=T)
  } else {
    labnb_serve(serve=F)
  }
}

