
 #makeCacheMatrix consists of set, get, serinverse, getinv
 ## define the argument with default mode of "matrix"
 ## initialize inv as NULL; will hold value of matrix inverse 
 ## define the set function to assign new 
 ## value of matrix in parent environment
 ## if there is a new matrix, reset inv to NULL
library(MASS)
makeCacheMatrix <- function(x = matrix()) {
  ## this function is for catche its inverse
  
  makeCacheMatrix <- function(x = matrix()) { 
    }
    
    get <- function() x                    
    
    setinv <- function(inverse) inv <<- inverse  
    getinv <- function() inv                     
    list(set = set, get = get,
         setinv = setinv, 
         getinv = getinv)  
  }

  

  ##This is used to get the cache data
  ##It calculates the inverse of the matrix returned by makeCacheMatrix
  ## If the inverse is already calculated, then the matrix is not changed
  #cacheSolve will fetch the inverse from the cache. 

  cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
      message("getting cached data")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
  }
  
