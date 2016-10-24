//
//  LoginViewController.swift
//  carousel
//
//  Created by Monith Ilavarasan on 10/22/16.
//  Copyright © 2016 Monith Ilavarasan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let emailAlert = UIAlertController(title: "Email Required", message: "Please enter your email address", preferredStyle: .alert)
    
    let emailWrongAlert = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid Email or Password", preferredStyle: .alert)
    
    let secondsToDelay = 2.0
    
    @IBOutlet weak var signInScroll: UIScrollView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInButtonView: UIView!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var logInIndicator: UIActivityIndicatorView!
    
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set scroll view frame size
        signInScroll.contentSize = signInScroll.frame.size
        
        //set inset for mild scroll
        signInScroll.contentInset.bottom = 100
        
        buttonInitialY = signInButtonView.frame.origin.y
        buttonOffset = -120
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to display
            
            // Move the button up above keyboard
            self.signInButtonView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            // Scroll the scrollview up
            self.signInScroll.contentOffset.y = self.signInScroll.contentInset.bottom
        }
        
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
        }
        
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        emailAlert.addAction(OKAction)
        
        // add the OK action to the wrong email alert controller
        emailWrongAlert.addAction(OKAction)
        
        func run(after wait: TimeInterval, closure: @escaping () -> Void) {
            let queue = DispatchQueue.main
            queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPushBack(_ sender: AnyObject) {
        
        navigationController!.popViewController(animated: true)
        
    }

    @IBAction func onTapGesture(_ sender: AnyObject) {
        
        view.endEditing(true)
        self.signInButtonView.frame.origin.y = self.buttonInitialY
        
        
    }
    
    
    @IBAction func tapSignIn(_ sender: AnyObject) {
        
        logInIndicator.startAnimating()
        
        if emailText.text!.isEmpty {
            
            present(emailAlert, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            self.logInIndicator.stopAnimating()
        } else if emailText.text != "monith" || passwordText.text != "password" {
            run(after:secondsToDelay){
                self.logInIndicator.stopAnimating()
                self.present(self.emailWrongAlert, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                }//delay
            }
            
        }//email-password either empty or wrong
        
        if emailText.text == "monith" && passwordText.text == "password"{
            run(after: secondsToDelay) {
                self.logInIndicator.stopAnimating()
                // This code will run after the delay
                self.performSegue(withIdentifier: "tutorialSegue", sender: nil)
            }
        }//email-password right
        
    }//tapSignIn

}
