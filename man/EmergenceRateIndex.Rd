% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EmergenceRateIndex.R
\name{EmergenceRateIndex}
\alias{EmergenceRateIndex}
\title{Emergence Rate Index or Germination Rate Index}
\usage{
EmergenceRateIndex(
  germ.counts,
  intervals,
  partial = TRUE,
  total.seeds = NULL,
  method = c("shmueligoldberg", "sgsantanaranal", "bilbrowanjura", "fakorede")
)
}
\arguments{
\item{germ.counts}{Germination counts at each time interval. Can be partial
or cumulative as specified in the argument \code{partial}.}

\item{intervals}{The time intervals.}

\item{partial}{logical. If \code{TRUE}, \code{germ.counts} is considered as
partial and if \code{FALSE}, it is considered as cumulative. Default is
\code{TRUE}.}

\item{total.seeds}{Total number of seeds.}

\item{method}{The method to be used. Either \code{"shmueligoldberg"},
\code{"sgsantanaranal"}, \code{"bilbrowanjura"} or \code{"fakorede"}.
Default is \code{"shmueligoldberg"} (see \strong{Details}).}
}
\value{
The value of the Emergence rate index with the units according to
  \code{method} as follows.

  \item{\code{shmueligoldberg}}{\mjseqn{\mathrm{count}}}
  \item{\code{sgsantanaranal}}{\mjseqn{\mathrm{no \, unit}}}
  \item{\code{bilbrowanjura}}{\mjseqn{\mathrm{count} \, time^{-1}}}
  \item{\code{fakorede}}{\mjseqn{time \, \mathrm{count}^{-1}}}
}
\description{
Compute the Emergence rate index or Germination rate index according to
\itemize{ \item
\insertCite{shmueli_emergence_1971;textual}{germinationmetrics} and
it's modification by
\insertCite{de_santana_alise_2004;textual}{germinationmetrics}
\insertCite{ranal_how_2006}{germinationmetrics}; \item
\insertCite{bilbro_soil_1982;textual}{germinationmetrics}; and
\item
\insertCite{fakorede_relation_1980;textual}{germinationmetrics},
\insertCite{fakorede_variability_1981;textual}{germinationmetrics},
and
\insertCite{fakorede_heterotic_1983;textual}{germinationmetrics}.}
\loadmathjax
}
\section{Details}{
 Several germination indices are referred to as Emergence
  rate Index (\mjseqn{ERI}).

  \subsection{\insertCite{shmueli_emergence_1971;textual}{germinationmetrics}}{
   With argument \code{method} specified as \code{"shmueligoldberg"}
  \mjseqn{ERI} is estimated as follows.

  \mjsdeqn{ERI = \sum_{i=i_{0}}^{k-1}N_{i}(k-i)}

  Where, \mjseqn{N_{i}} is the number of seeds germinated in the \mjseqn{i}th
  time interval (not the accumulated number, but the number corresponding to
  the \mjseqn{i}th interval), \mjseqn{i_{0}} is the time interval when
  emergence/germination started, and \mjseqn{k} is the total number of time
  intervals.

  A modification for the same was suggested by
  \insertCite{de_santana_alise_2004;textual}{germinationmetrics}
  \insertCite{ranal_how_2006}{germinationmetrics} and is estimated by
  dividing Emergence rate index (\mjseqn{ERI}) by total number of emerged
  seedlings (or germinated seeds) as follows with argument \code{method}
  specified as \code{"sgsantanaranal"}).

  \mjsdeqn{ERI_{mod} = \frac{\sum_{i=i_{0}}^{k-1}N_{i}(k-i)}{N_{g}} =
  \frac{ERI}{N_{g}}}

  Where, \mjseqn{N_{g}} is the total number of germinated seeds at the end of
  the test, \mjseqn{N_{i}} is the number of seeds germinated in the
  \mjseqn{i}th time interval (not the accumulated number, but the number
  corresponding to the \mjseqn{i}th interval), \mjseqn{i_{0}} is the time
  interval when emergence/germination started, and \mjseqn{k} is the total
  number of time intervals. }

  \subsection{\insertCite{bilbro_soil_1982;textual}{germinationmetrics}}{
   With argument \code{method} specified as \code{"bilbrowanjura"}
  \mjseqn{ERI} is the estimated as follows.

  \mjsdeqn{ERI = \frac{\sum_{i=1}^{k}N_{i}}{\overline{T}} =
  \frac{N_{g}}{\overline{T}}}

  Where, \mjseqn{N_{g}} is the total number of germinated seeds at the end of
  the test, \mjseqn{N_{i}} is the number of seeds germinated in the
  \mjseqn{i}th time interval (not the accumulated number, but the number
  corresponding to the \mjseqn{i}th interval), and \mjseqn{\overline{T}} is
  the mean germination time or mean emergence time. }

  \subsection{\insertCite{fakorede_relation_1980,fakorede_variability_1981,fakorede_heterotic_1983;textual}{germinationmetrics}}{
   With argument \code{method} specified as \code{"fakorede"} \mjseqn{ERI} is
  the estimated as follows.

  \mjsdeqn{ERI = \frac{\overline{T}}{FGP/100}}

  Where, \mjseqn{\overline{T}} is the Mean germination time and \mjseqn{FGP}
  is the final germination time. }

  \subsection{Others}{ Apart from the above the above, the name Emergence
  rate index (\mjseqn{ERI}) has also been used to for the mathematical
  expressions for Speed of germination
  (\code{\link[germinationmetrics]{GermSpeed}})
  \insertCite{allan_seedling_1962,erbach_tillage_1982}{germinationmetrics},
   Timson's index (\code{\link[germinationmetrics]{TimsonsIndex}})
  \insertCite{chaudhary_effect_1970}{germinationmetrics},
  and George's index
  (\code{\link[germinationmetrics:TimsonsIndex]{GermRateGeorge}})
  \insertCite{chopra_effect_1980}{germinationmetrics}. }
}

\examples{
x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)

# From partial germination counts
#----------------------------------------------------------------------------
EmergenceRateIndex(germ.counts = x, intervals = int)
EmergenceRateIndex(germ.counts = x, intervals = int,
                   method = "shmueligoldberg")
EmergenceRateIndex(germ.counts = x, intervals = int,
                   method = "sgsantanaranal")
EmergenceRateIndex(germ.counts = x, intervals = int,
                   method = "bilbrowanjura")
EmergenceRateIndex(germ.counts = x, intervals = int,
                   total.seeds = 50, method = "fakorede")

# From cumulative germination counts
#----------------------------------------------------------------------------
EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE)
EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
                   method = "shmueligoldberg")
EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
                   method = "sgsantanaranal")
EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
                   method = "bilbrowanjura")
EmergenceRateIndex(germ.counts = y, intervals = int, partial = FALSE,
                   total.seeds = 50, method = "fakorede")

}
\references{
\insertAllCited{}
}
\seealso{
\code{\link[germinationmetrics]{GermSpeed}},
  \code{\link[germinationmetrics]{TimsonsIndex}},
  \code{\link[germinationmetrics:TimsonsIndex]{GermRateGeorge}}
}
