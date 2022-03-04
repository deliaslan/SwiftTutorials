//
//  main.swift
//  27- ProtocolSwiftProject
//
//  Created by Adem Deliaslan on 3.03.2022.
//

import Foundation

protocol Running {
    func myRun()
}

class Animal {
    func running(){
        print("Class running")
    }
}

class Dog : Animal {
    
}

let barley = Dog()

barley.running()

struct Bird : Running {
    func myRun() {
        print("Bird is singing")
    }
}

let kus = Bird()
kus.myRun()

class Cat : Animal, Running {
    func myRun() {
        print("protocol runnning")
    }
}

let cat = Cat()

cat.running()
cat.myRun()
