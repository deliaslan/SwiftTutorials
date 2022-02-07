//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Adem Deliaslan on 7.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isChange = false
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePhoto))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changePhoto(){
        
        print("Tapped")
        if isChange == false {
            imageView.image = UIImage(named: "erkek")
            label.text = "Erkek"
            isChange = true
        } else {
            imageView.image = UIImage(named: "kadin")
            label.text = "Kadın"
            isChange = false
        }
        
    }

}

