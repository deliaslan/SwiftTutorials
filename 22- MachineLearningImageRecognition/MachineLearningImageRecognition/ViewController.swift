//
//  ViewController.swift
//  MachineLearningImageRecognition
//
//  Created by Adem Deliaslan on 26.02.2022.
//

import UIKit
import CoreML //eklendi
import Vision //eklendi

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var chosenImage = CIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeButtonClicked(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
        if let ciImage = CIImage(image: imageView.image!) {
            chosenImage = ciImage
        }
        recognizeImage(image: chosenImage)
    }
    
    func recognizeImage(image: CIImage) {
        //1 request
        //2 handler
        resultLabel.text = "Finding..."
        if let model = try? VNCoreMLModel(for: MobileNetV2().model) {
            let request = VNCoreMLRequest(model: model) { vnrequest, error in
                if let results = vnrequest.results as? [VNClassificationObservation] {
                    if results.count > 0 {
                        let topResult = results.first
                        DispatchQueue.main.async {
                            let confidenceLevel = (topResult?.confidence ?? 0) * 100 //verilen değer 0-1 arasında olduğundan bu değeri % olarak göstermek için 100 ile çarpıyoruz.
                            let rounded = String(format: "%.2f",confidenceLevel)
                            self.resultLabel.text = "\(rounded)% : It's \(topResult!.identifier)"
                        }
                    }
                }
            }
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async { //global arka plandaki işlerin önceliklendirilmesini en üst seviyeye çıkarır.
                do{
                    try handler.perform([request])
                } catch {
                    print("Error :\(error.localizedDescription)")
                }
            }
        }
    }
}

