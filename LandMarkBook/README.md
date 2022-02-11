## Landmark Book App

### Uygulamada kullanılan özellikler

- Table View 

- Image View

- Segue

- Navigation Controller (Editor->Embed In -> Navigation Controller)
Yukarıdaki özellik sayesinde app üzerinde ileri geri navigasyonları eklenmektedir. Title özelliğine değer vererek başlığı da oluşturabiliriyoruz.

- İki farklı ekran arasında nasıl haberleşilirin temelini oluşturan kısım işlenmiştir.

- Yeni oluşturulan View Controllera erişmek için "identifier" ismi verilmesi gerekmektedir. (Storyboard Segue alannından)

- prepare segue ile ise yeni view alanına geçmeden yapmamız gereken işlemler var ise bunları burada gerçekleştiriyoruz.(Diğer sayfada oluşturulacak içeriğin sayfa yüklenmeden önce neleri göstereceğinin bildirilmesi gibi. Daha sonra bunlar viewDidLoad() içerisinde tanımalanarak yüklenince gösterilmesi sağlanır. )

### Ekran Görüntüleri

![App Screen](https://github.com/deliaslan/SwiftTutorials/blob/main/CatchTheKennyGame/screenshots/screen1.png?raw=true)
![App Screen](https://github.com/deliaslan/SwiftTutorials/blob/main/CatchTheKennyGame/screenshots/screen2.png?raw=true)
![App Screen](https://github.com/deliaslan/SwiftTutorials/blob/main/CatchTheKennyGame/screenshots/screen3.png?raw=true)