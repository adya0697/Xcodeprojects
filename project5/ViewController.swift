//
//  ViewController.swift
//  project5
//
//  Created by Adya Kar on 5/11/24.
//

import UIKit

class ViewController: UIViewController, PassDataFromAdyaVCtoViewController {
    
    
    
    @IBOutlet weak var tfFirstName: UITextField!
    
    @IBOutlet weak var tfLastName: UITextField!
    
    
    @IBOutlet weak var tfAge: UITextField!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAge: UILabel!
    
    @IBOutlet weak var lblFeedback: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTapButton(_ sender: Any) {
        let firstTf = tfFirstName.text ?? ""
        let secondTf = tfLastName.text ?? ""
        let thirdTf = tfAge.text ?? ""
        
        if firstTf.isEmpty {
            print("Please enter first name")
        } else  if secondTf.isEmpty {
            print("Please enter second name")
        } else if thirdTf.isEmpty {
            print("Please enter you age")
        } else{
            if let adyaViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdyaViewController") as? AdyaViewController {
                adyaViewController.refString1 = firstTf
                adyaViewController.refString2 = secondTf
                adyaViewController.refString3 = thirdTf
                adyaViewController.delegate = self
                self.navigationController?.pushViewController(adyaViewController, animated: true)
                
                // Clear the text fields after pushing AdyaViewController
                tfFirstName.text = ""
                tfLastName.text = ""
                tfAge.text = ""
                
            }
        }
    }
    func passDataFromAdyaVCtoViewController(name: String, age: String, feedback: String) {
        lblName.text = name
        lblAge.text = age
        lblFeedback.text = feedback
    }
    
}





