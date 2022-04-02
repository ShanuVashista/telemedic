//
//  LoginViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 30/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Refference outlet and variables
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!

    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tf_email.setLeftPaddingPoints(10)
        self.tf_password.setLeftPaddingPoints(10)
        self.tf_email.setRightPaddingPoints(10)
        self.tf_password.setRightPaddingPoints(10)

    }
    
}


// MARK: - IBAction's

extension LoginViewController
{
    @IBAction func btn_Forgotpasswordclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Signinclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateProfile1ViewController") as! CreateProfile1ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func btn_Signupclick(_ sender: Any)
    {
        
    }
    
    @IBAction func btn_Googleclick(_ sender: Any)
    {
        
    }

    @IBAction func btn_Appleclick(_ sender: Any)
    {
        
    }
    
    @IBAction func btn_Eyeclick(_ sender: Any)
    {
        if self.tf_password.isSecureTextEntry{
            self.tf_password.isSecureTextEntry = false
        }else{
            self.tf_password.isSecureTextEntry = true
        }
    }


}
