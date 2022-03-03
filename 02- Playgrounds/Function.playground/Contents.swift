import UIKit

func myFunction(){
    print("My Function without parameters")
}

myFunction()

//input output return

func sumFunction(x: Int, y: Int){
    print(x+y)
}

sumFunction(x: 3, y: 5)

// sumFunction with return

func sumFunction2(x:Int,y:Int) -> Int{
    return x + y
}

let sumProblem = sumFunction2(x: 3, y: 7)

print(sumProblem)


//logic func

func logicFunction(a:Int,b:Int)->String{
    if a > b {
        return "Greater"
    } else {
        return "Less"
    }
}

logicFunction(a: -10, b: 5)
