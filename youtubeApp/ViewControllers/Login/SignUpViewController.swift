//
//  SignUpViewController.swift
//  youtubeApp
//
//  Created by Macintosh on 14/9/20.
//  Copyright © 2020 Macintosh. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        //hide error label
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        
        Utilities.styleTextField(lastNameTextField)
        
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(passwordTextField)
        
        Utilities.styleFilledButton(signUpButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Chek the field and validate is correct, if correct return nil
    func validateFields() -> String? {
        //check that all field are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        
        let cleannedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !Utilities.isPasswordValid(cleannedPassword){
            return "Please make sure your password is at least 8 characters, contains a special character and number"
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        //validate the fields
        let error = validateFields()
        
        if error != nil{
            showError(error!)
        }else{
            //clean firstName and lastName
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
                //Check for errors
                if err != nil{
                    // There was an error
                    self.showError("Error creating user")
                }else{
                    //ini database
                    let db = Firestore.firestore()
                    
                    //add data to database
                    db.collection("users").addDocument(data: ["firstName": firstName, "lastName":lastName, "email":email, "password":password, "uid": res!.user.uid]) { (err) in
                        if error != nil {
                            //Show error message
                            self.showError("Error saving user data")
                        }
                    }
                }
            }
        }
        //Transition to the home screen
        self.transitionToHome()
    }
    
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        //let homeVC = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeNAV) as? ViewController
        let nav = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeNAV)
        
        view.window?.rootViewController = nav!
        //view.window?.rootViewController = homeVC
        view.window?.makeKeyAndVisible()
        
    }

}
