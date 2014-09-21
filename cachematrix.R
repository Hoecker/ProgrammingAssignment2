## Programming assignment 2, R programming course on Coursera
## Caching the inverse of a matrix

makeCacheMatrix <- function(the_matrix = matrix()) {
    ## This function creates a special matrix object
    ## that can cache its inverse.
    ## also have getters and setters for the original matrix
    ## and the inverse of the matrix
    
    inverse_matrix <- NULL         # creates the variable for the inverse
    
    set <- function(new_matrix = matrix()) {
        the_matrix <<- new_matrix  # set the matrix
        inverse_matrix <<- NULL    # inverse is NULL for the new matrix
    }
    
    get <- function(){
        the_matrix                 # get the matrix
    }
    
    setInverse <- function(inverse){
        inverse_matrix <- inverse  #  set (cache) the inverse
    }
    
    getInverse <- function(){
        inverse_matrix             # get the inverse of the matrix
    }
    
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)  # return a list of the functions

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    ## where x is a "special matrix" returned by makeCacheMatrix()
    ## if the inverse of a matrix has already been calculated, then
    ## retrieve the inverse from the cache
    
    ## assumption: the matrix is always invertible
    
    the_inverse <- x$getInverse()
    if (!is.null(the_inverse)){     # if the inverse has already been calculated
        message("getting cached data")
        return(the_inverse)         # return the inverse
    }
    inverse <- solve(x$get())       # calculate the inverse of the matrix
    x$setInverse(inverse)           # cache the calculated inverse
    inverse                         # return the inverse
    }    
}