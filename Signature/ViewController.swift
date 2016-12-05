//
//  ViewController.swift
//  Signature
//
//  Created by Supervisor on 20-11-16.
//  Copyright © 2016 Nerdvana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signatureView: YPDrawSignatureView!
    @IBOutlet var signatureImageView: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setScreeName(name: "ViewController")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearButtonTapped(_ sender: Any) {
        if self.signatureView.doesContainSignature {
            self.signatureView.clear()
            self.signatureImageView.image = nil
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        if self.signatureView.doesContainSignature {
            let signatureImage = self.signatureView.getCroppedSignature()
            self.signatureImageView.image = signatureImage
            
            
            let testVC = self.storyboard?.instantiateViewController(withIdentifier: "TestVC") as! TestViewController
            present(testVC, animated: true, completion: nil)
        }
    }

}

// Extension with convienience methods for using Google Analytics.
extension UIViewController {
    
    func setScreeName(name: String) {
        self.title = name
        self.sendScreenView()
    }
    
    func sendScreenView() {
        let tracker = GAI.sharedInstance().defaultTracker
        tracker?.set(kGAIScreenName, value: self.title)
        
        if let builder = GAIDictionaryBuilder.createScreenView() {
        let dictionary = (builder.build())! as NSMutableDictionary
        tracker?.send(dictionary as [NSObject: AnyObject]!)    }
    }


//    func trackEvent(category: String, action: String, label: String, value: NSNumber?) {
//        if let tracker = GAI.sharedInstance().defaultTracker {
//        let trackDictionary = GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: label, value: value).build()
//        tracker.send(trackDictionary)
//        }
//    }
    
}

