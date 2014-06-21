## These two functions are designed to store an inverted matrix in cache memory after its' initial inversion.
## First function creates a special "matrix" object that can cache its' own inversion. 
## Second function calculates the inversion of the matrix or if inversion was previously calculated it returns its'
## cached value.

## Function 1: This function creates a special "matrix", 
## which is really a list of commands to invert matrix and cache its' inversion.

makeCacheMatrix<-function(x = matrix()) {
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function() 
  x
  setmatrix<-function(solve) 
  m<<-solve
  getmatrix<-function() 
  m
  list(set=set,get=get,setmatrix=setmatrix,getmatrix=getmatrix)
}

## Function 2: This function first checks if inversion of a given matrix was calculated before, if so its' returns
## its' cached value. If the inversion wasn't calculated it utilized the list of commands from first function 
## to create the inversion and cache it.

cacheSolve<-function(x=matrix(), ...) {
  m<-x$getmatrix()
  if(!is.null(m)){
    message("Displaying the cached matrix inversion.")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setmatrix(m)
  m
}

## The simple way to check both functions. 
## Remember that if you choose an non invertible matrix you'll get an error from solve function.

matrix(c(4,3,3,2),2,2)
M<-makeCacheMatrix(matrix(c(4,3,3,2),2,2))
cacheSolve(M)
cacheSolve(M)

