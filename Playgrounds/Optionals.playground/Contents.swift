import UIKit

var myName: String = "James"


myName.uppercased()


//optional

var optName : String?

// optName!.uppercased() //burada RAM de yer almayan ve sadece tanımlanmış değişkene işlem yapılmaya çalışılmıştır



// optionals : ? vs !

var myAge = "Ayva"

// var myAge = "5"

// eğer tanımlanan değer karşılamıyorsa ?? ile varsayılan değer atıyoruz
var myInteger = (Int(myAge) ?? 0) * 5

if let myNumber = Int(myAge) {
    print(myNumber * 5)
} else {
    print("wrong input")
}

/*
 Optional kullamımı kullanıcı etkileşimi olan uygulamalarda gerçekten çok önemli bir yere sahip bu yüzden bu konuyu örneklerle
 iyice irdelemek ve özümsemek gerekmektedir. ! ile GARANTİ veriyoruz, ?? ile input hatalı ile varsayılan değerle programın çökmesini engelleiyoruz.
 Bunların dışında verimizin türünü if bloğuyla kontrol ederek kullanıcıya yönelik mesajı ekrana basabiliyoruz.
 
 */


