import UIKit


// PART 1
// Variables & Constants

var greeting = "Hello, playground"

var myNum = 5 * 4

10 * 5

print("Hava nasıl oralarda ?")


//snake case -> user_name
//camel case -> userName

// String
var userName = "Adem"

userName.append("&Çiğdem")
userName.lowercased()
userName.uppercased()

userName = "Çiğdem"

print(userName)

// integer

let userAge = 38

let myNumber = 4

userAge/myNumber

//userAge = 30 //constant değerleri değiştirilmez

let pi = 3.14

// userAge * pi


//double
let userAgeD = 50.0

var myNumberD = 4.0

userAgeD/myNumberD

myNumber

// boolean

var myBoolean = false
myBoolean = true


//PART 2

// değişken tipini önceden belirlemek

var myString: String = "Ayva"

myString = "Elma"

// let anotherNUmber : Int = 10.0
let anotherNUmber : Int = Int(10.0)

let stringNumber: String = String(20)

//define
let myVariable: String  //initialization gerçekleşmedi yani RAM de yer kaplamıyor

//initialzation gerçekleşti
myVariable = "Test"
// myVariable = "Test2" //diyemeyiz
myVariable.uppercased()


// PART 3

// Arrays

var myFavoriteMovies = ["Pulp Fiction", "Kill Bill", "Reservoir Dogs", 5, true] as [Any] //dediğimizde dizide farklı tipleri tanımlayabiliriz

//as -> casting
//any -> any object


// any olduğunda özelliklere ya da metodlara tip bilinmediğinden erişilemz
myFavoriteMovies[0]
myFavoriteMovies[1]
myFavoriteMovies[2]
myFavoriteMovies[3]
myFavoriteMovies[4]


var myStringArray = ["Test5", "Test2", "Test3"]

myStringArray[0].uppercased()
myStringArray.count

//aynı elemanı farklı şekilde getirme yöntemi
myStringArray[2]
myStringArray[myStringArray.count - 1]
myStringArray.last

//Sıralama İşlemi
myStringArray.sort()




var myNumberArray = [1,2,3,4,5,6,7]
myNumberArray.append(8)

myNumberArray
myNumberArray[0] = 12

// Set
// Unordered collection, unique elements
var mySet : Set = [1,2,3,4,5,1,2]
mySet

var myStringSet: Set = ["a","b","c","a"]


var myInternetArray = [1,2,3,3,0,3,4,5]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
print(myInternetSet)


var mySet1: Set = [1,2,3]
var mySet2: Set = [3,4,5]

var mySet3 = mySet1.union(mySet2)
print(mySet3.sorted()) // benzer değerleri tek sefer yazar


// Sözlük Dictionary

//key-value pairing

var myFavoriteDirectors = ["Pulp Fiction" : "tarantino", "Lock Stock" : "Guy Ritchie", "The Dark Knight" : "Christopher Nolan"]

myFavoriteDirectors["Pulp Fiction"]
myFavoriteDirectors["The Dark Knight"]

myFavoriteDirectors["Pulp Fiction"] = "Quentin Tarantino"
print(myFavoriteDirectors)

myFavoriteDirectors["Seven Samurai"] = "Akira Kurisowa"
print(myFavoriteDirectors)



var myDictionary = ["Run" : 100 , "Swim": 200, "Basketball": 300]
myDictionary["Run"]


var myList = [["Atil" : 60, "Hikmet" : 45],["Bar" : 2, "Zeynep" : 50]]
print(myList[1]["Bar"]!)
