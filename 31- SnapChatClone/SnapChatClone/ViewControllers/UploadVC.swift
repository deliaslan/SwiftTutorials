//
//  UploadVC.swift
//  SnapChatClone
//
//  Created by Adem Deliaslan on 8.03.2022.
//

import UIKit

class UploadVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var uploadImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(choosePhoto))
        uploadImageView.addGestureRecognizer(gestureRecognizer)
        // Do any additional setup after loading the view.
    }
    
    @objc func choosePhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        uploadImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadClicked(_ sender: Any) {
    }
    
 

}
