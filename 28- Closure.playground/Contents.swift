import Cocoa

var greeting = "Hello, playground"

func sum(num1: Int, num2: Int) -> Int {
    return num1 + num2
}

sum(num1: 5, num2: 6)

func multiply(num1: Int, num2: Int) -> Int{
    return num1 * num2
}

multiply(num1: 5, num2: 6)

func calculate(num1: Int, num2: Int, myFunction: (Int, Int) -> Int) -> Int {
    return myFunction(num1, num2)
}

// başka bir fonksiyon başka bir fonksiyona parametre olarak geçilebilir
calculate(num1: 5, num2: 4, myFunction: sum)
calculate(num1: 5, num2: 4, myFunction: multiply)

//Closure olayının nasıl ilerlediğini aşama aşama görüyoruz.
calculate(num1: 9, num2: 5, myFunction: { (num1: Int, num2: Int) -> Int in
    return num1 * num2
})


calculate(num1: 9, num2: 5, myFunction: { (num1, num2) -> Int in
    return num1 * num2
})

calculate(num1: 9, num2: 5, myFunction: { (num1, num2) in
    return num1 * num2
})

calculate(num1: 9, num2: 5, myFunction: { (num1, num2) in num1 * num2 })

calculate(num1: 9, num2: 5, myFunction: { $0 * $1})

//dizilerde closure kullanımı
let myArray = [10,20,30,40,50]

func test(num1: Int) -> Int{
    return num1 / 5
}

//test fonksiyonunu parametre gibi kullanma
myArray.map(test)
//test fonksiyonu yazmadan direkt içerisinde işlemi yapma
print(myArray.map({($0 / 5)}))
