//
//  ViewController.swift
//  34- ThreadingProject
//
//  Created by Adem Deliaslan on 20.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var data = Data()
    var tracker = 0
    
    let urlStrings = ["https://s1.1zoom.me/big3/32/Germany_Houses_Quedlinburg_Street_Street_lights_610313_3840x2560.jpg", "https://s1.1zoom.me/big3/55/England_Castles_Panorama_Stokesay_Castle_Made_of_610726_5120x2384.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!) //Backgorund thread
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data) //main thread
            }
            
        }
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(changeImage))
    }
    
    @objc func changeImage() {
        if tracker == 0 {
            tracker += 1
        } else {
            tracker -= 1
        }
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!) //Backgorund thread
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data) //main thread
            }
            
        }
        
        //thread etmeden kullanımı
//        data = try! Data(contentsOf: URL(string: urlStrings[tracker])!)
//        imageView.image = UIImage(data: data)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threading Test"
        
        return cell
    }
}

