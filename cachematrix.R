## These two functions are designed to store an inverted matrix. First function creates a special object 
## that can cache its' inversion Second function calculates the inversion of the matrix from the first function;
## if the inversion has been calculated before it returns the cached matrix.

## Function 1: This function creates a special "matrix", 
## which is really a list to create matrix and cache its' inversion.

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

## Function 2: This function calculates the invertion of matrix created above or if already done before then it
## returns its' stored value.

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

