//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Adem Deliaslan on 4.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeButton(_ sender: Any) {
        imageView.image = UIImage(named: "photo2")
    }
    
}

