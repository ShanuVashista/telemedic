//
//  ForgotPasswordViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 30/03/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var tf_email: UITextField!

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tf_email.setLeftPaddingPoints(10)
        self.tf_email.setRightPaddingPoints(10)
        
    }
}


// MARK: - IBAction's

extension ForgotPasswordViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Resentpasswordclick(_ sender: Any)
    {
        
    }
    
    @IBAction func btn_Resendlinkclick(_ sender: Any)
    {
        
    }
}
