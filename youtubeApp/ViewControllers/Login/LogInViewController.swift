//
//  SignInViewController.swift
//  youtubeApp
//
//  Created by Macintosh on 14/9/20.
//  Copyright © 2020 Macintosh. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        //hide error label
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(logInButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logInTapped(_ sender: Any) {
        //Validate textfield
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Sign in user
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err != nil {
                //Couldn't sign in
                self.showError("Couldn't sign in, please check you email address or password and try again")
            }else{
                //transition to home
                self.transitionToHome()
            }
        }
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        //let homeVC = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? ViewController
        
        let nav = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeNAV)
        
        view.window?.rootViewController = nav!
        //view.window?.rootViewController = homeVC
        view.window?.makeKeyAndVisible()
        
    }
    
}
