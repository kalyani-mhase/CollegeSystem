//
//  ViewController2.swift
//  CollegeSystem
//
//  Created by Mac on 14/10/21.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var userIdTExtField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login pages"

    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        let id = userIdTExtField.text
        let name = userNameTextField.text
        
        if let vc3 = storyboard?.instantiateViewController(withIdentifier: "ViewController3") as? ViewController3{
            if id == "kalyani" && name == "kalyani123"{
        self.navigationController?.pushViewController(vc3, animated: true)
        }
        }
    }
    
}
