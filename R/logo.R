

#' @title Add Logo to Tracker
#'
#' @param tracker ggtrack tracker object
#' @param logo character file path or image url. Image extension can be any of:
#' \itemize{
#'   \item{jpeg}
#'   \item{jpg}
#'   \item{png}
#'   \item{svg}
#' }
#' @param height_tracker numeric tracker height in cm.
#' @param position data.frame generated by get \link[ggtrack]{get_positions}
#' @param justification numeric between 0 and 1 passed to \link[grid]{rasterGrob}.
#' @param ... additional options passed to \link[grid]{rasterGrob}
#'
#' @importFrom tools file_ext
#' @import RCurl
#' @import png
#' @import jpeg
#' @import rsvg
#' @importFrom magick image_read_svg
#'
#' @return tracker
#'
#' @examples
#' \dontrun{
#'   make_tracker() %>% add_logo('https://www.r-project.org/logo/Rlogo.png', justification = 1)
#' }
logo <- function(tracker, logo, height_tracker, position, justification, ...) {

  # check if url or file
  typ <- ifelse(grepl('http', logo), 'url', 'file')

  # check type of logo
  ext <- tolower(file_ext(logo))

  if (typ == 'url') {
    logo <- RCurl::getURLContent(logo)
  }

  if (ext == 'png') {
    logo_imported <- png::readPNG(logo)
  } else if (ext %in% c('jpg', 'jpeg')) {
    logo_imported <- jpeg::readJPEG(logo)
  } else if (ext == 'svg') {
    logo_imported <- magick::image_read_svg(logo, height = 300)
  } else {
    stop(paste0('Unable to Add filetype: ', ext))
  }

  lg <- grid::rasterGrob(logo_imported, x = justification, just = justification, height = unit(height_tracker, 'cm'), name = 'logo', ...)

  # define position
  p <- as.list(position[position$order == 'L', ])

  tracker +
    annotation_custom(lg, xmin = p$xmin, xmax = p$xmax)

}

#' @rdname logo
#' @family add_logo
#' @family gg
#' @family tracker
#' @export
add_logo <- function (tracker, ...) {
  UseMethod("add_logo", tracker)
}

#' @rdname logo
#' @family add_logo
#' @family gg
#' @export
add_logo.gg <- function(tracker, logo, height_tracker, position, justification, ...) {

  logo(tracker, logo, height_tracker, position, justification, ...)

}

#' @rdname logo
#' @family add_logo
#' @family tracker
#' @export
add_logo.tracker <- function(tracker, logo, justification, ...) {

  height_tracker <- tracker$height
  position <- tracker$pos
  banner <- tracker$track
  git <- tracker$git
  ts <- tracker$ts

  tracker$track <- logo(banner, logo, height_tracker, position, justification, ...)

  mtrack <- obj_tracker(tracker, 'logo')

  return(mtrack)

}
