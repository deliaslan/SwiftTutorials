//
//  UploadViewController.swift
//  InstagramCloneWithFireBase
//
//  Created by Adem Deliaslan on 17.02.2022.
//

import UIKit
import Firebase


class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate { //UIImagePickerControllerDelegate, UINavigationControllerDelegate eklendi
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.isUserInteractionEnabled = true //gerek olmayabilir
        imageView.addGestureRecognizer(gestureRecognizer)
        
        //Klavyenin kapanmasını istediğimizde yapmamız gereken
        let gestureRecognizerKeyboard = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizerKeyboard)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
        print("keyboard gizlendi")
    }
    
    @objc func chooseImage() {
        
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
        print("resime tıklandı")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("image\(uuid).jpg")
            imageReference.putData(data, metadata: nil) { metaData, error in
                if error != nil {
                    
                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error", btnTitle: "OK")
                    
                } else {
                    
                    imageReference.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            // print(imageUrl) //test code
                            
                            //DATABASE
                            let fireStoreDB = Firestore.firestore()
                            var fireStoreReference: DocumentReference? = nil
                            let fireStorePost = ["imageURL": imageUrl, "postedBy" : Auth.auth().currentUser?.email, "postComment": self.commentText.text!, "date" : FieldValue.serverTimestamp(), "likes" : 0] as [String: Any]
                            
                            fireStoreReference = fireStoreDB.collection("Posts").addDocument(data: fireStorePost, completion: { (error) in
                                if error != nil {
                                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error", btnTitle: "OK")
                                } else {
                                    
                                    self.imageView.image = UIImage(named: "select_image")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0 //gitmesini istediğimiz sayfa
                                }
                            })
                            
                            
                        }
                    }
                    
                }
            }
        }
        
    }
    
    func makeAlert(title: String?, message: String?, btnTitle: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
}
