//
//  ViewController.swift
//  Richa
//
//  Created by Kishor Lodhia on 10/06/16.
//  Copyright © 2016 Kishor Lodhia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var txt_phone: UITextField!
    @IBOutlet weak var btn_register: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btn_register.enabled=false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        print(txt_phone.text)
        print(string)
        
        let newString = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if newString.characters.count != 10{
            btn_register.enabled=false
        }
        else{
            btn_register.enabled=true
        }


        
        return true
        
    }
    
    @IBAction func register_press(sender:UIButton)  {
        
        self.performSegueWithIdentifier("gotoOTP", sender: self)
        
    }
}

