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
            let alert = UIAlertController(title: "Error!", message: "Kullanıcı Adı Griniz", preferredStyle: UIAlertController.Style.alert)
            let btnOK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(btnOK)
            self.present(alert, animated: true, completion: nil)
        } else if pwText.text == "" {
            let alert = UIAlertController(title: "Error!", message: "Şifre Giriniz", preferredStyle: UIAlertController.Style.alert)
            let btnOK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(btnOK)
            self.present(alert, animated: true, completion: nil)
        } else if pw2Text.text == "" {
            let alert = UIAlertController(title: "Error!", message: "Şifreyi doğrulayınız!", preferredStyle: UIAlertController.Style.alert)
            let btnOK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(btnOK)
            self.present(alert, animated: true, completion: nil)
        } else if pwText.text != pw2Text.text {
            let alert = UIAlertController(title: "Error!", message: "Şifreler eşleşmemektedir. Yeniden deneyiniz.", preferredStyle: UIAlertController.Style.alert)
            let btnOK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
                self.pwText.text = ""
                self.pw2Text.text = ""
            }
            
            alert.addAction(btnOK)
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Success!", message: "Başarılı bir şekilde kaydoldunuz!", preferredStyle: UIAlertController.Style.alert)
            let btnOK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(btnOK)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

