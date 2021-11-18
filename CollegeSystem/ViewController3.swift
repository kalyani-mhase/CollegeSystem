//
//  ViewController3.swift
//  CollegeSystem
//
//  Created by Mac on 14/10/21.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var departTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    var toolbar1 = UIToolbar()
    var toolbar2 = UIToolbar()
    var toolbar3 = UIToolbar()
     var college = ["ASC College Rahuri","R.B.N.B College","New Arts college","Nagar College"]
    var department = ["Art","Commerce","Science","Computer Science"]
    
    var year = ["First years","Second Year","third Year","Fourth year"]
    
    var collegePickerView = UIPickerView()
    var departPickerView = UIPickerView()
    var classPickerView = UIPickerView()

    var userId : String?
    var userName : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "College Information"
        
        let toolBarDone1 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donebarBtnAction1))
        let spaceBtn1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn1 = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancelbarBtnAction1))
        toolbar1.items = [toolBarDone1,spaceBtn1,cancelBtn1]
        toolbar1.backgroundColor = .blue
        toolbar1.sizeToFit()
        collegeTextField.inputAccessoryView = toolbar1
        let toolBarDone2 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donebarBtnAction2))
        let spaceBtn2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn2 = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancelbarBtnAction2))
        toolbar2.items = [toolBarDone2,spaceBtn2,cancelBtn2]
        toolbar2.backgroundColor = .blue
        toolbar2.sizeToFit()
        departTextField.inputAccessoryView = toolbar2
        let toolBarDone3 = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donebarBtnAction3))
        let spaceBtn3 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelBtn3 = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancelbarBtnAction2))
        toolbar3.items = [toolBarDone3,spaceBtn3,cancelBtn3]
        toolbar3.backgroundColor = .blue
        toolbar3.sizeToFit()
        classTextField.inputAccessoryView = toolbar3
        
        
        //tags
            collegePickerView.tag = 1
        departPickerView.tag = 2
        classPickerView.tag = 3
          //inputView
        collegeTextField.inputView = collegePickerView
        departTextField.inputView = departPickerView
        classTextField.inputView = classPickerView
        //datasource
        collegePickerView.dataSource = self
        classPickerView.dataSource = self
        departPickerView.dataSource = self
        //delegate
        collegePickerView.delegate = self
        departPickerView.delegate = self
        classPickerView.delegate = self
        
        collegeTextField.delegate = self
        departTextField.delegate = self
        classTextField.delegate = self
        
        

    }
   
    @IBAction func NextButton(_ sender: Any) {
       if let vc4 = storyboard?.instantiateViewController(withIdentifier: "ViewController4") as? ViewController4{
        
        vc4.depart = departTextField.text
        vc4.className1 = classTextField.text
        
        self.navigationController?.pushViewController(vc4, animated: true)
       }
    }
}


extension ViewController3: UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return college.count
        case 2:
            return department.count
        case 3:
            return year.count
        default:
            return 1
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            collegeTextField.text = college[row]
            collegeTextField.resignFirstResponder()
        case 2:
            departTextField.text = department[row]
            departTextField.resignFirstResponder()
        case 3:
            classTextField.text = year[row]
            classTextField.resignFirstResponder()
        default:
            return
        }
        }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
              return college[row]
        case 2:
            return department[row]
        case 3:
            return year[row]
        default:
            return "data not found"
        }
    }
    
    @objc  func donebarBtnAction1()
    {
        collegeTextField.resignFirstResponder()
    }
    @objc  func cancelbarBtnAction1()
    {
        collegeTextField.resignFirstResponder()
    }
    @objc func donebarBtnAction2()
    {
            departTextField.resignFirstResponder()
    }
    @objc func cancelbarBtnAction2()
    {
            departTextField.resignFirstResponder()
    }
    @objc func donebarBtnAction3()
    {
        classPickerView.resignFirstResponder()
    }
    @objc func cancelbarBtnAction3()
    {
        classPickerView.resignFirstResponder()
    }
        
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }

}

