labnb_serve <- function(serve=T) {
  servr::jekyll(input = c(list.dirs("_source")),
                output = c(rep("_posts", length(list.dirs("_source")))),
                serve = serve)
}

