context("pairsnp distance calculation")
library(pairsnp)

test_that("empty file", {
  fasta.file <- system.file("testdata", "empty.aln", package = "pairsnp")
  expect_error(import_fasta_sparse(fasta.file), "File does not contain any sequences!")
})

test_that("ambig", {
  fasta.file <- system.file("testdata", "ambig.aln", package = "pairsnp")
  sparse.data <- import_fasta_sparse(fasta.file)
  expect_true(all(snp_dist(sparse.data)==matrix(c(0,    0,    2,    1,    1,
                                                  0,    0,    2,    2,    2,
                                                  2,    2,    0,    3,    3,
                                                  1,    2,    3,    0,    0,
                                                  1,    2,    3,    0,    0),
                                                nrow = 5, byrow = TRUE)))
})

test_that("ambig with n", {
  fasta.file <- system.file("testdata", "ambig.aln", package = "pairsnp")
  sparse.data <- import_fasta_sparse(fasta.file)
  expect_true(all(snp_dist(sparse.data, compare.n = TRUE)==matrix(c(0,    2,    4,    3,    3,
                                                                    2,    0,    4,    4,    4,
                                                                    4,    4,    0,    5,    5,
                                                                    3,    4,    5,    0,    0,
                                                                    3,    4,    5,    0,    0),
                                                                  nrow = 5, byrow = TRUE)))
})

test_that("lowercase", {
  fasta.file <- system.file("testdata", "lowercase.aln", package = "pairsnp")
  sparse.data <- import_fasta_sparse(fasta.file)
  expect_true(all(snp_dist(sparse.data)==matrix(c(0,    1,    2,    3,
                                                  1,    0,    3,    4,
                                                  2,    3,    0,    4,
                                                  3,    4,    4,    0),
                                                nrow = 4, byrow = TRUE)))
})

test_that("bad aln", {
  fasta.file <- system.file("testdata", "bad.aln", package = "pairsnp")
  expect_error(import_fasta_sparse(fasta.file), "Error! sequences are of different lengths!")
})

