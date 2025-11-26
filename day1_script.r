# Basic operations
print("Hellow")
a <- 100
print(a)
b <- sin(3*pi)
print(b)


a <- 11
b <- 15
c <- sqrt(a^2+b^2)
print(c)

greeting <- "Banana"
#INTERESTING
complex_num <- 4 + 5i

print(class(a))
print(class(greeting))
print(class(complex_num))

# Logical operators
print(class(TRUE))
print(class(FALSE))
print(class(NA))

# Logical operators == < > !=

print(TRUE==NA) 

#AND, OR
# Pilas porque usa logical 1 y 0

T&T
T&F

T <- TRUE

T&T

0 == FALSE

TRUE&NA
TRUE|NA

FALSE&NA
FALSE|NA

# IF STATEMENTS

blood_pressure <- 200

if(blood_pressure > 150){
    print("High blood pressure")
} else{
    print("Low blood pressure")
}

if(blood_pressure < 150){
    print("High blood pressure")
} else if (blood_pressure > 150) {
   print("Go")
} else {
    print("N")
}


oct <- 10
nov <- 16
dec <- 70

month <- dec

if((month^2) > 100 & sin(month) > 0 ){
    print("BOTH TRUE")
} else if ((month^2) > 100 | sin(month) > 0) {
   print("At least one true")
} else {
    print("None is true")
}

if(NA){
    print("What happens?")
}

# Vectors

vector1 <- c(1,2,3,4,5,6,7)
vector2 <- c(1,2,3,"Go",5,6,7)
vector3 <- c(1,2,3,"Go",5,TRUE,7)
vector4 <- c(1,2,3,4,5,TRUE,7, 8, 0)
vector5 <- c(vector1, 10)
print(vector1)
print(vector2)
print(vector3)
print(vector4)
print(vector5)

length(vector1)
vector1[1]
vector1[5]
#not 2
vector1[-2]
vector1[1:3]
vector1[4:length(vector1)]

#Evaluates for all INTERESTING
# Returns array of logicals
vector1 > 5
length(vector1 > 5)

#Returns subset of arrays that fullfils the condition
vector1[vector1>5]
length(vector1[vector1>5])

condi <- vector1 > 5
vector4[condi]

# LOOPS
for (i in vector1){
    print(i)
}

for (i in 1:5){
    print(vector1[i])
}

for (i in 1:20){
    print(sqrt(i))
}

sqrt(vector1)

x <- 0
while(x<5) {
    print(x)
    x<-x+1
}

x <- 40
while(x>=0){
    print(x)
    x<-x-1
}

print(x)
