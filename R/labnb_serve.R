labnb_serve <- function() {
  servr::jekyll(input = c(".", list.dirs("_source")),
                output = c(".", rep("_posts", length(list.dirs("_source")))),
                serve = TRUE)
}

