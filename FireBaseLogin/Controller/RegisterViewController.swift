//
//  RegisterViewController.swift
//  FireBaseLogin
//
//  Created by Sheick on 3/29/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction 
    override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        //Optional Binding -> if LET
        //Guard Statement -> Guard lET
        
        //OPTIONAL
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              // ...
                
                if let e = error{
                    
                    //localizedDescription to handle different lanaguages
                    print(e.localizedDescription)
                }
                
                else{
                    //whenever you call a function, it needs to use self keyboard while in a Closure
                    self.performSegue(withIdentifier: K.registerSegue , sender: self)
                }
            }
        }
    }
    
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
