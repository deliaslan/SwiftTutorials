import UIKit

var myNumber = 1

myNumber = myNumber + 1

myNumber += 1

myNumber -= 1

//While Loop

var number = 0
while number < 10 {
    print(number)
    number = number + 1
}


var characterAlive = true

while characterAlive == true {
    print("Karakter1 yaşıyor")
    characterAlive = false
}


3 < 5
5 < 3
5 >= 3
5 <= 3
5 == 5
5 != 4


// For Loop

var myFruitArray = ["Elma", "Armut", "Ayva", "Çilek"]

print(myFruitArray[0])
print(myFruitArray[1])
print(myFruitArray[2])
print(myFruitArray[3])

// Örn 1
for fruit in myFruitArray{
    print(fruit)
}

//Örn 2
var myNumbers = [10,20,30,40,50,60]

for num in myNumbers{
    print(num/5)
}

//Örn 3
for myNewInt in 1 ... 5{
    print(myNewInt)
}

// Soru

var fibonacciArray = [1,1,2,3,5,8,13]
 
for number in fibonacciArray {
    
    let myNumber = number * 5
    print(myNumber)
 
}
