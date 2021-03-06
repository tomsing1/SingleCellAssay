##' @include AllClasses.R
###############################
## Base
###############################

##' Accessor for cellData \code{data.frame}
##'
##' Returns the \code{cellData} \code{data.frame}.
##' @title cData
##' @param sc An object with \code{cellData}
##' @return \code{data.frame}
##'
##' 
##' @export
##' @docType methods
##' @rdname cData-methods
##' @keywords accessor
setGeneric('cData', function(sc) standardGeneric('cData'))

##' Do two objects conform in dimension and type?
##'
##' Returns false if:
##' other does not inherit from Matrix
##' Otherwise returns a bitmask, which is the sum of:
##' 1: objects have same number of rows
##' 2: objects have same number of columns
##' 4: objects have same number of layers
##' @param dl DataLayer
##' @param other Another object
##' @return bitmask containing number of dimensions that agree
##' @author andrew
##'  @export conform
setGeneric('conform', function(dl, other) standardGeneric('conform'))


##' How many layers does a DataLayer have?
##'
##' @param x DataLayer
##' @return numeric, number of layers
##' @export nlayer
setGeneric('nlayer', function(x) standardGeneric('nlayer'))


##' Which layer is active?
##'
##' @param x DataLayer
##' @return numeric, active layer
##' @export layer
##' @aliases layer,DataLayer-method
setGeneric('layer', function(x) standardGeneric('layer'))

##' Set active layer
##'
##' @param x DataLayer
##' @param value identifier of layer
##' @return DataLayer with new active layer
##' @export layer<-
##' @aliases layer<-,DataLayer,numeric-method
##' @aliases layer<-,DataLayer,character-method
setGeneric('layer<-', function(x, value) standardGeneric('layer<-'))


##' Add Another Layer
##'
##' Another layer, initialized with NA will be appended to the DataLayer
##' Layer will be named \code{name}
##' @param x DataLayer
##' @param name character
##' @return DataLayer with appended layer
##' @export addlayer
##' @aliases addlayer,DataLayer,character-method
setGeneric('addlayer', function(x, name) standardGeneric('addlayer'))

##' Get name of active layer
##'
##' @param x DataLayer 
##' @return character
##' @export layername
##' @aliases layername,DataLayer-method
setGeneric('layername', function(x) standardGeneric('layername'))

##' Set name of active layer
##'
##' @param x DataLayer
##' @param value character
##' @return DataLayer
##' @export
##' @aliases layername<-,DataLayer,character-method
setGeneric('layername<-', function(x, value) standardGeneric('layername<-'))

##' Accessor for wellKey
##'
##' This returns the wellKey, which is a unique identifier generated by \code{idvars} in the \code{mapping}
##' @param sc An object with a \code{wellKey}
##' @return \code{integer} giving the unique id generated
##' @aliases getwellKey,SingleCellAssay-method
##' @export
setGeneric('getwellKey', function(sc) standardGeneric('getwellKey'))

##' Accessor for cellData \code{AnnotatedDataFrame}
##'
##' Returns the \code{cellData}.
##' @param sc An object with \code{cellData}
##' @return \code{AnnotatedDataFrame}
##' @aliases cellData,SingleCellAssay-method
##' @export
setGeneric('cellData', function(sc) standardGeneric('cellData'))

##' @export
setGeneric("cData<-", function(sc, value) standardGeneric("cData<-"))

##' Accessor for featureData \code{data.frame}
##'
##' Returns the \code{featureData} \code{data.frame}.
##' @title fData
##' @param object An object with \code{featureData}
##' @return \code{data.frame} 
##' @docType methods
##' @rdname fData-methods
##' @keywords accessor
##' @name fData
##' @aliases fData,SingleCellAssay-method
##' @importMethodsFrom Biobase fData
#setGeneric('fData', function(sc) standardGeneric('fData'))
NULL

##' Accessor for featureData \code{AnnotatedDataFrame}
##'
##' Returns the \code{featureData}.
##' @param object An object with \code{featureData}
##' @return \code{AnnotatedDataFrame}
##' @docType methods
##' @rdname featureData-methods
##' @keywords accessor
##' @name featureData
##' @aliases featureData,SingleCellAssay-method
##' @importMethodsFrom Biobase featureData
#setGeneric('featureData', function(object) standardGeneric('featureData'))
NULL

##' Evaluate an expression (returning a \code{logical} vector in the context of
##' \code{x}
##'
##' Really just syntactic sugar.
##'
##' @param x A matrix or \code{data.frame} typically
##' @param thesubset An expression, which evaluated in either the current
##' environment, or the parent, yields a logical vector
##'
##' @return The same class as \code{x} typically, with entries in which thesubset was \code{TRUE}
##' 
##' @export
##' @docType methods
##' @rdname subset-methods
##' @keywords transformation
setGeneric('subset')


##' Return a deep copy of an object
##'
##' Because SingleCellAssay keeps the datastore in an environment, it's not sufficient to create a new object to make a copy on an object
##' @param sc object
##' @return copy of sc
##' @export
##' @docType methods
##' @rdname copy-methods
setGeneric('copy', function(object) standardGeneric('copy'))


###############################
## LmWrapper
###############################
##' fit a zero-inflated regression
##'
##' Given a design and formula, fit the zero inflated regression, storing the fits in slots
##' \code{fitC} and \code{fitD}
##' @param object inheriting from \code{LMlike}
##' @param response a vector, same length as the design, or if missing then use the current response
##' @param ... currently ignored
##' @return LMlike or subclass
##' @export
setGeneric('fit', function(object, response, ...) standardGeneric('fit'))

##' Coefficients of zero-infated
##'
##' Given a fitted LMlike, return the coefficients from discrete or continuous
##' @param object LMlike
##' @param which  character vector, one of "C" (continuous) or "D" (discrete) specifying which component should be returned
##' @param ... passed to methods
##' @return numeric vector
##' @export
setGeneric('coef', function(object, ...) standardGeneric('coef'))
#setGeneric('coefD', function(object) standardGeneric('coefD'))

##' Run a likelihood-ratio test
##'
##' Compares the change in likelihood between the current \code{formula} and one dropping terms in \code{drop.terms}.
##' Only complete terms can be tested at this time
##' @param object LMlike or subclass
##' @param drop.terms character vector of \code{formula} terms
##' @return array giving test statistics
##' @export
##' @seealso fit
##' @seealso waldTest
setGeneric('lrTest', function(object, drop.terms) standardGeneric('lrTest'))

##' Run a Wald test
##'
##' Run a Wald tests on discrete and continuous components
##' @param object LMlike or subclass
##' @param hypothesis.matrix argument suitable to be passed to car::lht
##' @return array giving test statistics
##' @export
##' @seealso fit
##' @seealso lrTest
##' @seealso lht
##' @importFrom car linearHypothesis.default
setGeneric('waldTest', function(object, hypothesis.matrix) standardGeneric('waldTest'))
## setGeneric('vcovC', function(object) standardGeneric('vcovC'))
## setGeneric('vcovD', function(object) standardGeneric('vcovD'))

##' Variance-covariance matrix for zero inflated
##'
##' Given a fitted LMlike, return the variance-covariance from discrete or continuous
##' @param object LMlike
##' @param which character vector, one of "C" (continuous) or "D" (discrete) specifying which component should be returned
##' @return matrix
##' @export
setGeneric('vcov', function(object) standardGeneric('vcov'))

##' Degrees of freedom of Zero inflated model
##'
##' @param object LMlike or subclass
##' @return vector giving the model degrees of freedom for continuous and discrete
##' @export
setGeneric('dof', function(object) standardGeneric('dof'))

###############################
## old style LRT
###############################
##' Likelihood Ratio Tests for SingleCellAssays
##'
##' Tests for a change in ET binomial proportion or mean of positive ET
##' Likelihood Ratio Test for SingleCellAssay objects
##'
##' Combined Likelihood ratio test (binomial and normal) for SingleCellAssay and derived objects
##' @exportMethod LRT
##' @docType methods
##' @aliases LRT
##' @aliases LRT,SingleCellAssay,character-method
##' @rdname LRT-methods
setGeneric("LRT",function(sca,comparison,...) standardGeneric("LRT"))

###############################
## Nanostring
###############################
##' thresholds for positive expression
##'
##' @param nsa NanostringAssay object
##' @return modified nsa
##' @export
setGeneric('thresholdNanoString', function(nsa, ...) standardGeneric('thresholdNanoString'))


