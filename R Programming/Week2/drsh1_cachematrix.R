https://github.com/drsh1

# project matrix


# the point of this exercise is to produce two functions: 1) to store result of 
# certain calculation in cache memory, 2) to return and use the result of 
# calculation stored earlier in cache memory. 

# the purpose of this is to avoid repeating the calculation of a certain process
# over and over and instead use the once calculated result, stored in cache memory. 
# this is supposed to save time.

# in this particular case the the calculation is to inverse a matrix

# the primary task of 1st function makeCacheMatrixis is to store result 
# of matrix inversion in cache. however, 1st function is in fact 
# a combination of 4 sub-functions that respectively:

# a) return matrix to be inverted (GET)
# b) read matrix to be inverted (SET)
# c) return inverted matrix (GETINVERSEMATRIX)
# d) read inverted matrix (SETINVERSEMATRIX)

# the most important observation is that the 1st function makeCacheMatrix
# DOES NOT run the calculation (does not invert the matrix). it can only 
# read upfront calculated result of inversion and store it in cache.

makeCacheMatrix <- function(x = matrix())   # i assume x must be matrix
  {   
    inverseMatrixStoredInCache <- NULL
    set <- function(y) 
      {
        x <<- y
        inverseMatrixStoredInCache <<- NULL
      }
    get <- function() x # same as: get <- function() {return(x)}
    setInverseMatrix <- function(inverseMatrix) inverseMatrixStoredInCache <<- inverseMatrix
    getInverseMatrix <- function() inverseMatrixStoredInCache  # same as: getinversematrix <- function() {return(m)}
    list(set = set, get = get, setinvmat = setInverseMatrix, getinvmat = getInverseMatrix) # create a list of 4 functions to use within makeCacheMatrix 
}


# the primary task of 2nd function cacheSolve is to return the result of
# matrix inversion stored earlier in cache. if cache is empty (nothing is stored
# in cache) the function will calculate the result of matrix inversion (solve(x))
# and store it in cache.

cacheSolve <- function(x, ...) 
  {
    inverseMatrix <- x$getInverseMatrix()  # try to extract the stored value from 1st function
    if(!is.null(inverseMatrix)) # if something is stored
      {
        message("getting cached data") # print message on using cache
        return(inverseMatrix) # print result from cache
      }
    data <- x$get() 
    inverseMatrix <- solve(data, ...)  # otherwise 
    x$setInverseMatrix(inverseMatrix)
    inverseMatrix # print solution (inversed matrix)
  }