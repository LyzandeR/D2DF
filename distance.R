#calculate the distance between two vectors
distance <- function(x, y , data=NULL, method='euclidean', p=2) {
  #checks
  if (!is.null(data)) {
    data <- as.data.frame(data)
    x <- data[[as.character(substitute(x))]]
    y <- data[[as.character(substitute(y))]]
  }
  if (length(x) != length(y)) stop('x and y need to have the same length')
  if (is.factor(x)) {x <- as.numeric(x)}
  if (is.factor(y)) {y <- as.numeric(y)}
  if (!is.numeric(x) || !is.numeric(y)) stop('x and y need to be numeric')
  if (method != 'minkowski') {p <- 2}
  if (p < 1) stop('P cannot be less than 1')
  
  #calculate distance
  i <-  switch(method,
               manhattan = 1,
               euclidean = 2,
               canberra  = 0,
               minkowski = p,
               stop('method should be one of the following: \n1. euclidian\n2. manhattan\n3. canberra'))
  
  if( i != 0) {
    sum(abs(x-y)^i)^(1/i)
  }else{
    sum(abs(x-y) / (abs(x) + abs(y)))
  }
}

