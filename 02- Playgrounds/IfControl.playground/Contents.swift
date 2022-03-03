import UIKit

var myAge = 38

print("30 -")

if myAge < 30 {
    print("30 -")
} else if myAge > 30 && myAge < 40 {
    print("30-40")
} else {
    print("40 +")
}

//and
3 < 5 && 8 < 7
//or
3 < 5 || 8 < 7

//Stringlerde koşul

var myString = "Adem"

if myString == "Adem" {
    print("Doğru yazıldı")
}
