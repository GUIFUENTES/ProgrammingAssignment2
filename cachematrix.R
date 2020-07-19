## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function 
## This function creates an object named "matrix" that can cache its inverse inside of an object "m" and 
##it use the function "solve" to returns its inverse


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL                                                      ## I set the value of "m" to null
  set <- function (y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve                     #I Changed the function "mean" and its references by solve"
  getsolve <- function() m
  list(set = set, get = get,                                 ## Creates lists to the functions
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function
## This function returns the inverse of the matrix that is returned by "makeCacheMatrix" function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()                                         ##
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()                 
  m <- solve(data, ...)
  x$setsolve(m)
  m
}

