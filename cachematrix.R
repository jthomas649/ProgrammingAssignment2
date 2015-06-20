## The function myCacheMatrix creates a special "matrix" object that can cache its inverse

## Here is how it works:
## myCacheMatrix takes as input a matrix x
## myCacheMatrix returns a list of functions in a separate environment "set, get, setinverse, getinverse"
## myCacheMatrix duplicates the input matrix x in the same environment as the functions in the list "set"
## myCacheMatrix creates an object m for temporary storage of the inverse "set"
## The function setinverse computes the inverse of x 
## The function getinverse houses the matrix m which will be called in the next function as the location of the inverse of x

makeCacheMatrix<-function(x=matrix()){
m<-NULL
set<-function(y){
x<<-y
m<<-NULL
}
get<-function()x
setinverse<-function(solve)x<<-solve
getinverse<-function()m
list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}

## The function cacheSolve computes the inverse of the special "matrix" 

## Here is how it works: 
## cacheMatrix takes as input the function myCacheMatrix applied to matrix x
## If the inverse has already been calculated (and the matrix has not changed), then the cacheSolve should retrieve the inverse from the cache.
## cacheMatrix assigns the inverse of the matrix to the object m and returns m "m <- x$getinverse()"

cacheSolve <- function(x,...) {
## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if(!is.null(m)) {
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
        
