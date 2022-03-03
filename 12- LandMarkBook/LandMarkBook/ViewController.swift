//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Adem Deliaslan on 10.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    //definin variables
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Landmark Book"
        
        
        // landmark book data
        landMarkNames.append("Ayasofya")
        landMarkNames.append("Boğaziçi")
        landMarkNames.append("Colosseum")
        landMarkNames.append("Dubai")
        landMarkNames.append("Eiffel")
        landMarkNames.append("Truva")
        
        
        
        
        landMarkImages.append(UIImage(named: "ayasofya.jpg")!)
        landMarkImages.append(UIImage(named: "boğaziçi.jpg")!)
        landMarkImages.append(UIImage(named: "colosseum.jpg")!)
        landMarkImages.append(UIImage(named: "dubai.jpg")!)
        landMarkImages.append(UIImage(named: "eiffel.jpg")!)
        landMarkImages.append(UIImage(named: "truva.jpg")!)
    }

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landMarkNames.remove(at: indexPath.row)
            landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landMarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenLandMarkName = landMarkNames[indexPath.row]
        chosenLandMarkImage = landMarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    //diğer viewlardaki alanlarda oluşturulan değişken ve moetdolara ulaşmak için prepare segue kullanıyoruz
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandMarkName = chosenLandMarkName
            destinationVC.selectedLandMarkImage = chosenLandMarkImage
        }
    }

}

