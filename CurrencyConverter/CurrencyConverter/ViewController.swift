//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Adem Deliaslan on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var CADLabel: UILabel!
    @IBOutlet weak var CHFLabel: UILabel!
    @IBOutlet weak var GBPLabel: UILabel!
    @IBOutlet weak var JPYLabel: UILabel!
    @IBOutlet weak var USDLabel: UILabel!
    @IBOutlet weak var TRYLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        // 1- Request 6 Session
        // 2- Response & Data
        // 3- Parsing & JSON Serialization
        
        
        
        //1. Request 6 Session
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=aabc86fce28bb7c9355fad00ec3cf375&format=1")
        
        let session = URLSession.shared
        
        //Closure
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                //2. Response & Data
                
                // hhtp bağlantılara izin vermek için
                //info.plist kısmından App Transport Security Setting seçilir ve üstünde + ya basılır.
                // Açılan yerden Allow arbitrary loads diyerek seçile özellik YES olarak seçilir.
                // Artık httplere izin vermektedir.
                if data != nil {
                    do{
                      let jsonResponse =   try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        // Async
                        DispatchQueue.main.async {
                           // print(jsonResponse)  //test code
                           // print(jsonResponse["rates"])
                            
                            if let rates = jsonResponse["rates"] as? [String: Any] {
                               // print(rates)
                                if let cad = rates["CAD"] as? Double{
                                   // print(cad)
                                    self.CADLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.CHFLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.GBPLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.JPYLabel.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.USDLabel.text = "USD: \(usd)"
                                }
                                if let turkishLira = rates["TRY"] as? Double{
                                    self.TRYLabel.text = "TRY: \(turkishLira)"
                                }
                                
                            }
                            
                        }
                        
                    } catch {
                        print("Error Data Response")
                    }
                }
            }
        }
        
        task.resume()
    }
    
}

