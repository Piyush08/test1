//
//  VerifyOTP.swift
//  Richa
//
//  Created by Kishor Lodhia on 10/06/16.
//  Copyright © 2016 Kishor Lodhia. All rights reserved.
//

import UIKit

class VerifyOTP: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var btn_verify: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        txt1.enabled=true
//        txt2.enabled=false
//        txt3.enabled=false
//        txt4.enabled=false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // On inputing value to textfield
        if (textField.text?.characters.count < 1  && string.characters.count > 0){
            
            
            let nextTag = textField.tag + 1
            
            // get next responder
            let nextResponder = textField.superview?.viewWithTag(nextTag)
            
            if (nextResponder == nil){
                //nextResponder = textField.superview?.viewWithTag(1)
            }
            textField.text = string
            nextResponder?.becomeFirstResponder()
            return false
        }
        else if (textField.text?.characters.count >= 1  && string.characters.count == 0){
            // on deleteing value from Textfield
            //let previousTag = textField.tag - 1
            
            // get next responder
            //var previousResponder = textField.superview?.viewWithTag(previousTag)
            
            //if (previousResponder == nil){
              //  previousResponder = textField.superview?.viewWithTag(1)
            //}
            textField.text = ""
            //previousResponder?.becomeFirstResponder()
            return false
        }
        else if (textField.text?.characters.count == 1){
            textField.text=""
        }
        
        //if
        
        return true
    }

    @IBAction func verify_pressed (sender:UIButton){
        
        if txt1.text?.characters.count != 0 && txt2.text?.characters.count != 0 && txt3.text?.characters.count != 0 && txt4.text?.characters.count != 0 {
            self.performSegueWithIdentifier("Confirmed", sender: self)
        }
        else{
            let alertController = UIAlertController(title: "Passcode is incorrect", message: "Please try again!", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
