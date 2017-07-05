#mass_spec
#install packages and load library
#> install.packages("readMzXmlData")
#> Library(readMzXmlData)

getwd()
list.files()
readMzXmlFile("SBT3014.mzXML")
sample1 <- readMzXmlFile("SBT3014.mzXML")
readMzXmlFile("SBT3015.mzXML")
sample2 <- readMzXmlFile("SBT3015.mzXML")

#s1 <- sample 2 <-[[1]]
str(s1)
s1$specturm
s1$metaData

s1int <- s1$specturm

mass <- s1int$mass
str(mass)
int <- s1int$int
str(int)
plot(x=mass, y=int)
plot(x=mass, y=log(int))
d <- data.frame(mass=mass, int=int)
head(d)
ggplot(data=d, aes(x=mass, y=int))
ggplot(data=d, aes(x=mass, y=int)) + geom_point()
ggplot(data=d, aes(x=mass, y=log(int)) + geom_point()

s2 <- sample2[[2]]
str(s2)
spec2 <- s2$spectrum
str(spec2)
mass2 <- spec2$mass 
str(mass2)
int2 <-  spec2$int
str(int2)
plot(x=mass2, y=int2)
plot(x=mass2, y=log(int2))
d <- data.frame(mass=(mass, mass2), int=(int, int2))
d2 <- data.frame(mass2, int=int2)
str(d2)


getData <- function(i){
  message(sprintf('processing %d...', i))
  mass <- sample2[[i]]$spectrum$mass
  int <- log(sample2[[i]]$spectrum$int)
  output <- data.frame(sample=i, mass=mass, int=int)
  return(output)
}

sample.i <- 1:length(sample2)
res <- lapply(sample.i, getData)
res <- do.call(rbind.data.frame, res)
