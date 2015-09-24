//
//  LoginViewController.swift
//  Facebook
//
//  Created by matt hunter on 9/24/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    var emailInitialY: CGFloat!
    var passwordInitialY: CGFloat!
    var logoInitialY: CGFloat!
    var loginButtonInitialY: CGFloat!
    
    let offset: CGFloat = -50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailInitialY = emailAddressField.frame.origin.y
        passwordInitialY = passwordField.frame.origin.y
        logoInitialY = logoView.frame.origin.y
        loginButtonInitialY = loginButton.frame.origin.y
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapAway(sender: AnyObject) {
        emailAddressField.endEditing(true)
        passwordField.endEditing(true)
        logoView.center.y = logoInitialY
        loginButton.center.y = loginButtonInitialY

    }
    
    @IBAction func emailEditAction(sender: AnyObject) {
        if emailAddressField == nil {
            loginButton.enabled = false
            
        }
    }

    @IBAction func passwordEditAction(sender: AnyObject) {
        if passwordField == nil {
            loginButton.enabled = false
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view p   roperties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        self.emailAddressField.frame.origin = CGPoint(x: self.emailAddressField.frame.origin.x, y: self.emailInitialY)
        self.passwordField.frame.origin = CGPoint(x: self.passwordField.frame.origin.x, y: self.passwordInitialY)
        self.logoView.frame.origin = CGPoint(x: self.logoView.frame.origin.x, y: self.logoInitialY)
        self.loginButton.frame.origin = CGPoint(x: self.loginButton.frame.origin.x, y: self.loginButtonInitialY)
        
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        _ = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
        
        self.emailAddressField.frame.origin = CGPoint(x: self.emailAddressField.frame.origin.x, y: self.emailInitialY + self.offset)
        self.passwordField.frame.origin = CGPoint(x: self.passwordField.frame.origin.x, y: self.passwordInitialY + self.offset)
        self.logoView.frame.origin = CGPoint(x: self.logoView.frame.origin.x, y: self.logoInitialY + self.offset)
        self.loginButton.frame.origin = CGPoint(x: self.loginButton.frame.origin.x, y: self.loginButtonInitialY + self.offset)
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
