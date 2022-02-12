//
//  ViewController.swift
//  SimpsonsBook
//
//  Created by Adem Deliaslan on 11.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //for tableView UITableViewDelegate, UITableViewDataSource eklenmeli
    
    var simpsonFamilyCharactersArray = [Simpson]()
    
    var chosenSimpsonsCharacter: Simpson?
    
    @IBOutlet weak var imageViewMain: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //tableviewı başlagıçta yükleme
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Simpson's Book"
        
        // Simpson objects defining
        let homer = Simpson(name: "Homer Simpson", age: 55, job: "Nuclear Technician", roleStatus: RoleStatus.Father, image: UIImage(named: "homer")!)
        let marge = Simpson(name: "Marge Simpson", age: 55, job: "Housewife", roleStatus: RoleStatus.Father, image: UIImage(named: "marge")!)
        let lisa = Simpson(name: "Lisa Simpson", age: 55, job: "Student", roleStatus: RoleStatus.Father, image: UIImage(named: "lisa")!)
        let bart = Simpson(name: "Bart Simpson", age: 10, job: "Student", roleStatus: RoleStatus.Father, image: UIImage(named: "bart")!)
        let maggie = Simpson(name: "Maggie Simpson", age: 2, job: "Baby", roleStatus: RoleStatus.Father, image: UIImage(named: "maggie")!)
        
        //Diziye karakterleri ekliyoruz
        simpsonFamilyCharactersArray.append(homer)
        simpsonFamilyCharactersArray.append(marge)
        simpsonFamilyCharactersArray.append(lisa)
        simpsonFamilyCharactersArray.append(bart)
        simpsonFamilyCharactersArray.append(maggie)
    }
    
    //delete özelliğini ekleme
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            simpsonFamilyCharactersArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    
    //Tablo oluşturmak için gerekli metodlar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonFamilyCharactersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonFamilyCharactersArray[indexPath.row].name //dizideki elemanın içeriğini çekme şekli.
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenSimpsonsCharacter = simpsonFamilyCharactersArray[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    
    //diğer viewlardaki alanlarda oluşturulan değişken ve moetdolara ulaşmak için prepare segue kullanıyoruz
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpsonCharacter = chosenSimpsonsCharacter
        }
    }
    
    
    
    
    
    
    
    
    
}

