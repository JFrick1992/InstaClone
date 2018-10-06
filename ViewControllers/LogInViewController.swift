//
//  LogInViewController.swift
//  InstaClone
//
//  Created by Jacob Frick on 10/5/18.
//  Copyright © 2018 Jacob Frick. All rights reserved.
//

import UIKit
import Parse
class LogInViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     On click action for login button to log in the user if valid entry
    */
    @IBAction func LogInButton(_ sender: Any) {
        if((usernameField.text?.isEmpty)! || (passwordField.text?.isEmpty)!) {            present(self.buildEmptyFieldAlertController(), animated: true )
        } else {
            PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) {
                (user , error) in
                if user != nil {
                    self.performSegue(withIdentifier: "logInSegue", sender: nil)
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }

}
