//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Adem Deliaslan on 16.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.topItem?.title = "Dark Mode / Light Mode"
        
        overrideUserInterfaceStyle = .light //kullanıcınnın kullandığı mod dikkate alamadan bulunduğu "view" ı light modda açar
        //Ayrıca info.plist kısmından -> User Interface Style direkt seçilebilmektedir.
        
       
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle //kullanıcının kullandığı dark/light modu alır
        if userInterfaceStyle == .dark {
            changeButton.tintColor = UIColor.white
        } else {
            changeButton.tintColor = UIColor.blue
        }
    }


}

