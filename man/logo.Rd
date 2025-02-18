% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/logo.R
\name{logo}
\alias{logo}
\alias{add_logo}
\alias{add_logo.gg}
\alias{add_logo.tracker}
\title{Add Logo to Tracker}
\usage{
logo(tracker, logo, height_tracker, position, justification, ...)

add_logo(tracker, ...)

\method{add_logo}{gg}(tracker, logo, height_tracker, position, justification, ...)

\method{add_logo}{tracker}(tracker, logo, justification, ...)
}
\arguments{
\item{tracker}{ggtrack tracker object}

\item{logo}{character file path or image url. Image extension can be any of:
\itemize{
\item{jpeg}
\item{jpg}
\item{png}
\item{svg}
}}

\item{height_tracker}{numeric tracker height in cm.}

\item{position}{data.frame generated by get \link[ggtrack]{get_positions}}

\item{justification}{numeric between 0 and 1 passed to \link[grid]{rasterGrob}.}

\item{...}{additional options passed to \link[grid]{rasterGrob}}
}
\value{
tracker
}
\description{
Add Logo to Tracker
}
\examples{
\dontrun{
  make_tracker() \%>\% add_logo('https://www.r-project.org/logo/Rlogo.png', justification = 1)
}
}
\seealso{
Other gg: 
\code{\link{caption}()},
\code{\link{qr}()}

Other tracker: 
\code{\link{caption}()},
\code{\link{qr}()}

Other gg: 
\code{\link{caption}()},
\code{\link{qr}()}

Other tracker: 
\code{\link{caption}()},
\code{\link{qr}()}
}
\concept{add_logo}
\concept{gg}
\concept{tracker}
