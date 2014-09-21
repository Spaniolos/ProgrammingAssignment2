## Functions that cache the inverse of a matrix
## Create the matrix that can cache its inverse
makeCacheMatrix <- function( m = matrix() ) {

  ##Init inverse property
  i <- NULL

  ##Set matrix
  set <- function( matrix ) {
    m <<- matrix
    i <<- NULL
  }

  ##Get Matrix
get <- function() {

  ##Return Matrix
  m
  }

##Set Inverse of the matrix
setInverse <- function(inverse) {
    i <<- inverse
  }

##Return Inverse Matrix
getInverse <- function() {
    i
  }

##Return List of Methods
list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

##Compute inverse of previous matrix. If it has been calculated then retrieve inverse
cacheSolve <- function(x, ...) {

  ##Return inverse of x
  m <- x$getInverse()

  ##Return inverse if its set
if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }

##Get Matrix from object
data <- x$get()

##Calculate inverse
m <- solve(data) %*% data

##Set inverse to object
x$setInverse(m)

##Return Matrix
m
}