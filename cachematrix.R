##These functions create an object that stores a matrix and cache's its inverse

##The function below creates special matrix, which is really a 
##list containing a function to: set the value of the matrix,
##get the value of the matrix, set the value of the inverse and
##get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {
  
  m <-NULL
  set <- function(y){
        x <<- y
        m <<- NULL
    
  }
  
  get <- function() x
  setinverse <<- function(solve) m <<- solve
  getinverse <<- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## This function creates an inverse matrix from the original matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  m<-x$getinverse()
  if(!is.null(m)){
    message("Getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data)
  x$setinverse(m)
  m
}
