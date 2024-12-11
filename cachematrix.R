## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

# This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Variable to store the inverse
  
  # Function to set the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL  # Reset the inverse cache when the matrix is updated
  }
  
  # Function to get the matrix
  get <- function() {
    x
  }
  
  # Function to set the inverse
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  # Function to get the inverse
  getInverse <- function() {
    inv
  }
  
  # Return a list of the functions
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# This function computes the inverse of the special "matrix" object created by makeCacheMatrix
cacheSolve <- function(x, ...) {
  # Check if the inverse is already cached
  inv <- x$getInverse()
  
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)  # Return the cached inverse
  }
  
  # If the inverse is not cached, compute it
  mat <- x$get()
  inv <- solve(mat, ...)  # Compute the inverse using the solve function
  x$setInverse(inv)  # Cache the computed inverse
  
  inv
}
