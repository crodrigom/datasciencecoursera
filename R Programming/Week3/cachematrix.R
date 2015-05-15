## This R file has two functions that compute the inverse matrix and
## cache it after computation.
## These function together allow the inverse matrix to be computed 
## only once. Saving computational resource


## makeCacheMatrix create an object that it is a derivation
## of the classic matrix object
## x should receive a matrix (i.e. mat <- matrix(1:4, 2,2))

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## cacheSolve computes the inverse matrix of the
## makeCacheMatrix object. The inverse matrix is calculated only once,
## if it already exist then the method will print the message
## "getting cached data" and will retrieve the cached matrix.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
