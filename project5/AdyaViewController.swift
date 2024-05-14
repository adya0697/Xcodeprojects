//
//  AdyaViewController.swift
//  project5
//
//  Created by Adya Kar on 5/11/24.
//

import UIKit

protocol PassDataFromAdyaVCtoViewController: AnyObject {
    func passDataFromAdyaVCtoViewController(name: String, age: String, feedback: String)
}

class AdyaViewController: UIViewController {
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var lblAge: UILabel!
    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfAge: UITextField!
    
    @IBOutlet weak var tfFeedback: UITextField!
    
    var refString1 = ""
    var refString2 = ""
    var refString3 = ""
    
    weak var delegate:PassDataFromAdyaVCtoViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("First Name from previous VC is \(refString1)")
        print("Last Name from previous VC is \(refString2)")
        print("Age from previous VC is \(refString3)")
        
        lblFirstName.text = refString1
        lblLastName.text = refString2
        lblAge.text = refString3
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onTapBackButton(_ sender: Any) {
        print("Clicked Back Button")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onTapSubmit(_ sender: Any) {
        
        let nameText = tfName.text ?? ""
        print("currenrt text in Adyas vc : \(nameText)")
        
        let ageText = tfAge.text ?? ""
        print("currenrt text in Adyas vc : \(ageText)")
        
        let feedbackText = tfFeedback.text ?? ""
        print("currenrt text in Adyas vc : \(feedbackText)")
        if nameText.isEmpty {
            print("Please enter name")
        } else  if ageText.isEmpty {
            print("Please enter age")
        } else if feedbackText.isEmpty {
            print("Please give feedback")
        } else{
            
            
            //this line giving data to delegate method
            delegate?.passDataFromAdyaVCtoViewController(name: nameText, age: ageText, feedback: feedbackText)
            
            //this line will do throws back to previous screen
            self.navigationController?.popViewController(animated: true)
            
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
}
