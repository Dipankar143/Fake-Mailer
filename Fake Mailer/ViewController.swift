//
//  ViewController.swift
//  Fake Mailer
//
//  Created by Dipanker on 02/10/17.
//  Copyright © 2017 BlackDeveloper. All rights reserved.
//

import UIKit
import Alamofire
import Toast_Swift

class ViewController: UIViewController {
    
    
    @IBOutlet var toLab: UITextField!
    @IBOutlet var fromLab: UITextField!
    @IBOutlet var subjectLab: UITextField!
    @IBOutlet var body: UITextField!
    @IBOutlet var from_name: UITextField!
    
    @IBAction func send(_ sender: Any) {
        
        let from_names = from_name.text
        let to = toLab.text
        let from = fromLab.text
        let text = body.text
        let subj = subjectLab.text
        
        if (from_names?.isEmpty==false && to?.isEmpty==false && from?.isEmpty==false && text?.isEmpty==false && subj?.isEmpty==false){
            if(isValidEmail(testStr: to!) == true && isValidEmail(testStr: from!)==true){
                let url="http://gourl.gq/email.php"
                let parm: [String:String] = ["sender_email":to!,"fake_email":from!,"subject":subj!,"name":from_names!,"txt":text!]
                
                Alamofire.request(url, method: .post, parameters: parm).response { (response) in
                    print(response.response!)
                }
            }
            else {
                self.view.makeToast("Please Input valid E-Mail Adress")
                
                
            }
        }
        else {
            self.view.makeToast("Please Input All Above The fields")
            
            
        }
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }





}

