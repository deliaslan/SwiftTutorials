//
//  SnapVC.swift
//  SnapChatClone
//
//  Created by Adem Deliaslan on 8.03.2022.
//

import UIKit
import ImageSlideshow

class SnapVC: UIViewController {

    @IBOutlet weak var timeLeftLabel: UILabel!
    
    var selectedSnap: Snap?
    var selectedTime: Int?
    var inputArray = [KingfisherSource]() //array ile slideları kingfisher kütüphanesi aracılığıyla göstereceğiz.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let leftTime = selectedTime {
            timeLeftLabel.text = "Time Left: \(leftTime)"
        }
        
        if let snap = selectedSnap {
            for imageUrl in snap.imageUrlArray {
                inputArray.append(KingfisherSource(urlString: imageUrl)!)
            }
            
            let imageSlideShow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.8))
            imageSlideShow.backgroundColor = UIColor.white
            
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.black
            pageIndicator.pageIndicatorTintColor = UIColor.lightGray
            imageSlideShow.pageIndicator = pageIndicator
            
            imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSlideShow.setImageInputs(inputArray)
            self.view.addSubview(imageSlideShow)
            
            self.view.bringSubviewToFront(timeLeftLabel) //en öne getiriyor
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
