//
//  ViewController.swift
//  CollegeSystem
//
//  Created by Mac on 14/10/21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
      title = "Login"
    }
  
    @IBAction func loginAction(_ sender: Any) {
        if let vc2 = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 {
            self.navigationController?.pushViewController(vc2, animated: true)
        }
    }
    


}

