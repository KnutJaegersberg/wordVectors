% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/matrixFunctions.R
\name{closest_to}
\alias{closest_to}
\title{Return the n closest words in a VectorSpaceModel to a given vector.}
\usage{
closest_to(matrix, vector, n = 10, fancy_names = TRUE)
}
\arguments{
\item{matrix}{A matrix or VectorSpaceModel}

\item{vector}{A vector (or a string or a formula coercable to a vector)
of the same length as the VectorSpaceModel. See below.}

\item{n}{The number of closest words to include.}

\item{fancy_names}{If true (the default) the data frame will have descriptive names like
'similarity to "king+queen-man"'; otherwise, just 'similarity.' The default can speed up
 interactive exploration.}
}
\value{
A sorted data.frame with columns for the words and their similarity
to the target vector. (Or, if as_df==FALSE, a named vector of similarities.)
}
\description{
This is a convenience wrapper around the most common use of
'cosineSimilarity'; the listing of several words similar to a given vector.
Unlike cosineSimilarity, it returns a data.frame object instead of a matrix.
cosineSimilarity is more powerful, because it can compare two matrices to
each other; closest_to can only take a vector or vectorlike object as its second argument.
But with (or without) the argument n=Inf, closest_to is often better for
plugging directly into a plot.

As with cosineSimilarity, the second argument can take several forms. If it's a vector or
matrix slice, it will be taken literally. If it's a character string, it will
be interpreted as a word and the associated vector from `matrix` will be used. If
a formula, any strings in the formula will be converted to rows in the associated `matrix`
before any math happens.
}
\examples{

# Synonyms and similar words
closest_to(demo_vectors,demo_vectors[["good"]])

# If 'matrix' is a VectorSpaceModel object,
# you can also just enter a string directly, and
# it will be evaluated in the context of the passed matrix.

closest_to(demo_vectors,"good")

# You can also express more complicated formulas.

closest_to(demo_vectors,"good")

# Something close to the classic king:man::queen:woman;
# What's the equivalent word for a female teacher that "guy" is for
# a male one?

closest_to(demo_vectors,~ "guy" - "man" + "woman")

}
