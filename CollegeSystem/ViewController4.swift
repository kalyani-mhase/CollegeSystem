//
//  ViewController4.swift
//  CollegeSystem
//
//  Created by Mac on 14/10/21.
//

import UIKit

class ViewController4: UIViewController {

    var depart : String?
    var className1 : String?
    
    @IBOutlet weak var departLabel: UILabel!
    
    @IBOutlet weak var className: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var rollText: UITextField!
    var db = database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail Information"
        departLabel.text = depart
        className.text = className1

       
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        var rollno  = Int(rollText.text!) ?? 0
        var name = nameText.text ?? ""
        
        db.insert(roll:rollno , name: name, collegeName: depart!, className: className1!)
        db.display()
    }
}
