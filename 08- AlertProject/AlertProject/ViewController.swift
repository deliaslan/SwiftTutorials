//
//  ViewController.swift
//  AlertProject
//
//  Created by Adem Deliaslan on 6.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var pwText: UITextField!
    @IBOutlet weak var pw2Text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        /*
         let alert = UIAlertController(title: "Error!", message: "User Name is Exist!", preferredStyle: UIAlertController.Style.alert)
         let btnOK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
         //button clicked
         print("Button Clicked")
         }
         alert.addAction(btnOK)
         self.present(alert, animated: true, completion: nil)
         */
        
        if userNameText.text == "" {
            makeAlert(title: "Error!", message: "Kullanıcı Adınızı Giriniz!")
        } else if pwText.text == "" {
            makeAlert(title: "Error!", message: "Şifrenizi giriniz!")
        } else if pw2Text.text == "" {
            makeAlert(title: "Error!", message: "Şifrenizi doğrulayınız!")
        } else if pwText.text != pw2Text.text {
            makeAlert(title: "Error!", message: "Şifreler eşleşmiyot!")
        } else {
            makeAlert(title: "Success!", message: "Başarılı bir şekilde kaydoldunuz!")
            
        }
        
        //aynı şeyleri her yere yazmak yerine metod/fonk. tanımlıyoruz.
        func makeAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let btnOK = UIAlertAction(title: title, style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(btnOK)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}
