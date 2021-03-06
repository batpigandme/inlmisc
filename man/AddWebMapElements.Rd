% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AddWebMapElements.R
\name{AddWebMapElements}
\alias{AddWebMapElements}
\alias{AddHomeButton}
\alias{AddClusterButton}
\alias{AddSearchButton}
\alias{AddLegend}
\title{Add Miscellaneous Web Map Elements}
\usage{
AddHomeButton(map, extent = NULL, position = "topleft")

AddClusterButton(map, clusterId, position = "topleft")

AddSearchButton(map, group, propertyName = "label", zoom = NULL,
  textPlaceholder = "Search...", openPopup = FALSE,
  position = "topleft")

AddLegend(map, labels, colors, radius, opacity = 0.5,
  symbol = c("square", "circle"), title = "EXPLANATION",
  position = "topright")
}
\arguments{
\item{map}{'\link[leaflet]{leaflet}'.
Map widget object}

\item{extent}{'Spatial*', 'Raster*', 'Extent', 'matrix', or 'numeric'.
Extent object (or object from which an \code{\link[raster]{extent}} object can be extracted/created)
representing a rectangular geographical area on the map.
The extent must be specified in the coordinate reference system (CRS) of the web map,
usually in latitude and longitude using WGS 84 (also known as \href{https://epsg.io/4326}{EPSG:4326}).
By default, the extent object is read from the map widget.}

\item{position}{'character'.
Position of the button on the web map.
Possible values are \code{"topleft"}, \code{"topright"}, \code{"bottomleft"}, and \code{"bottomright"}.}

\item{clusterId}{'character'.
Identification for the marker cluster layer.}

\item{group}{'character'.
Name of the group whose features will be searched.}

\item{propertyName}{'character'.
Property name used to describe markers, such as, \code{"label"} and \code{"popup"}.}

\item{zoom}{'integer'.
Zoom level for move to location after marker found in search.}

\item{textPlaceholder}{'character'.
Text message to show in search element.}

\item{openPopup}{'logical'.
Whether to open the marker popup associated with the searched for marker.}

\item{labels}{'character'.
Vector of text labels in the legend.}

\item{colors}{'character'.
Vector of (HTML) colors corresponding to \code{labels}.}

\item{radius}{'numeric'.
Border radius of symbols in the legend, in pixels.}

\item{opacity}{'numeric'.
Opacity of symbols in the legend, from 0 to 1.}

\item{symbol}{'character'.
Symbol type in the legend, either \code{"square"} or \code{"circle"}.}

\item{title}{'character'.
Legend title}
}
\value{
Used for the side-effect of a button placed on a web map.
}
\description{
These functions can be used to augment a \href{http://leafletjs.com/}{Leaflet} web map with additional elements.
The \code{AddHomeButton} function adds a button that zooms to the initial map extent.
The \code{AddClusterButton} function adds a button that toggles marker clusters on and off.
The \code{AddSearchButton} function adds a control that may be used to search markers/features location by property.
And the \code{AddCircleLegend} function adds a map legend.
}
\examples{
city <- rgdal::readOGR(system.file("extdata/city.geojson", package = "inlmisc")[1])
opt <- leaflet::markerClusterOptions(showCoverageOnHover = FALSE)
map <- CreateWebMap("Topo")
map <- leaflet::addMarkers(map, label = ~name, popup = ~name, clusterOptions = opt,
                           clusterId = "cluster", group = "marker", data = city)
map <- AddHomeButton(map)
map <- AddClusterButton(map, clusterId = "cluster")
map <- AddSearchButton(map, group = "marker", zoom = 15,
                       textPlaceholder = "Search city names...")
map

labels <- c("Non-capital", "Capital")
colors <- c("green", "red")
fillColor <- colors[(city@data$capital > 0) + 1L]
map <- CreateWebMap("Topo")
map <- leaflet::addCircleMarkers(map, radius = 6, color = "white", weight = 1,
                                 opacity = 1, fillColor = fillColor, fillOpacity = 1,
                                 fill = TRUE, data = city)
map <- AddLegend(map, labels = labels, colors = colors, radius = 5,
                 opacity = 1, symbol = "circle")
map

}
\seealso{
\code{\link{CreateWebMap}}
}
\author{
J.C. Fisher, U.S. Geological Survey, Idaho Water Science Center
}
\keyword{hplot}
