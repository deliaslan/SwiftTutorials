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
