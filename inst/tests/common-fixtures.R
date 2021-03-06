library(testthat)
library(devtools)
library(Biobase)
library(reshape)

geneid="Gene"
primerid='Gene'
measurement='et'
idvars=c('Subject.ID', 'Chip.Number', 'Well')
ncells <- 'Number.of.Cells'
phenovars=NULL
cellvars=c('Experiment.Number', 'Population', 'Stim.Condition')
featurevars=NULL

##Tests depending on vbeta
data(vbeta)
test_that("vbeta can be loaded",{
  expect_that(vbeta,is_a("data.frame"))
})

vbeta$et <- ifelse(is.na(vbeta$Ct), 0, 40-vbeta$Ct)

fd <- FluidigmAssay(vbeta, idvars=idvars, primerid=primerid, measurement=measurement,cellvars=cellvars,  ncells=ncells, geneid=geneid)
test_that('could create FluidigmAssay', {
  expect_that(fd, is_a('SingleCellAssay'))
    expect_that(fd, is_a('FluidigmAssay'))
})
