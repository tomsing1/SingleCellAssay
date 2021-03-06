% Generated by roxygen2 (4.0.1): do not edit by hand
\name{zlm}
\alias{zlm}
\title{Convenience function for running a zero-inflated regression}
\usage{
zlm(formula, data, method = "glm", silent = TRUE, ...)
}
\arguments{
\item{formula}{model formula}

\item{data}{a data.frame, list or environment in which formula is evaluated}

\item{method}{one of 'glm' or 'glmer'.  See SingleCellAssay:::methodDict for other possibilities.}

\item{silent}{if TRUE suppress common errors from fitting continuous part}

\item{...}{passed to \code{fit}, and eventually to the linear model fitting function}
}
\value{
list with "disc"rete part and "cont"inuous part
}
\description{
Fits a hurdle model on zero-inflated continuous data in which the zero process
is modeled as a logistic regression
and (conditional on the the response being >0), the continuous process is Gaussian, ie, a linear regression.
}
\examples{
data<- data.frame(x=rnorm(500), z=rbinom(500, 1, .3))
logit.y <- with(data, x*2 + z*2); mu.y <- with(data, 10+10*x+10*z + rnorm(500))
y <- (runif(500)<exp(logit.y)/(1+exp(logit.y)))*1
y[y>0] <- mu.y[y>0]
data$y <- y
fit <- zlm(y ~ x+z, data)
summary(fit$disc)
summary(fit$cont)
}
\seealso{
GLMlike, LMERlike
}

