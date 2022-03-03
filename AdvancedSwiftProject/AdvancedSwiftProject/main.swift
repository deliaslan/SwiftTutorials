//
//  main.swift
//  AdvancedSwiftProject
//
//  Created by Adem Deliaslan on 3.03.2022.
//

import Foundation

let classJames = MusicianClass(name: "James", age: 50, instrument: "Guitar")

print("classJames: \(classJames.age)")


//Immutable Struct

var structJames = MusicianStruct(name: "James", age: 50, instrument: "Guitar")  //let dediğimizde değiştirilemez olmaktadır.

print("structJames: \(structJames.age)")

classJames.age = 51

print("classJames: \(classJames.age)")

//structjJames.age = 51
//
//print("structJames: \(structJames.age)")


//Reference VS Value

var copyOfClassJames = classJames

var copyOfStructJames = structJames

print("copyOfClassJames: \(copyOfClassJames.age)")
print("copyOfStructJames: \(copyOfStructJames.age)")

copyOfClassJames.age = 52
copyOfStructJames.age = 52

print("copyOfClassJames: \(copyOfClassJames.age)")
print("copyOfStructJames: \(copyOfStructJames.age)")

print("classJames: \(classJames.age)")
print("structJames: \(structJames.age)")

//Reference types -> Class
// Copy -> Same object new reference -> 1 object + 2 references

// Value Type -> Struct
// Copy -> new object -> 2 objects


//Function vs Mutating Function
print("beforeClass: \(classJames.age)")
classJames.happyBirthday()
print("afterClass: \(classJames.age)")

print("beforeStruct: \(structJames.age)")
structJames.happyBirthday()
print("afterStruct: \(structJames.age)")


//TUPLE

let myTuple = (1,3)
print(myTuple.0)

let myTuple2 = (1,3,5)
print(myTuple2.2)

var myTuple3 = (1,3,5)

myTuple3.2 = 20
print(myTuple3.2)

let myTuple4 = ("Adem", 38)
print(myTuple4.0)

let myTuple5 = (10, [10,20,30])

print(myTuple5.1[1])

let preDefinedTuple: (String, String)

preDefinedTuple.0 = "Adem"
preDefinedTuple.1 = "Çiğdem"

print(preDefinedTuple)

let newTuple = (name: "Adem", metallica: true) //tuple lara isim atayabiliyoruz.

print(newTuple.metallica)

//GUARD LET VS IF LET

//GUARD -> DAHA OLUMSUZ BŞR YAKLAŞIM && confident

// IF -> DAHA POZİTİF


let myNumber = "elma"
//let myNumber = 5

func convertToIntegerGuard (stringInput : String) -> Int {
    guard let myInteger = Int(stringInput) else {
        return 0
    }
    return myInteger
}

func convertToIntegerIf (stringInput : String) -> Int {
    if let myInteger = Int(stringInput) {
        return myInteger
    } else {
        return 0
    }
}


print("If: \(convertToIntegerIf(stringInput: myNumber))")
print("Guard: \(convertToIntegerGuard(stringInput: myNumber))")
