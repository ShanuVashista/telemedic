//
//  CreateProfile2ViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 30/03/22.
//

import UIKit

class CreateProfile2ViewController: UIViewController {

    // MARK: - Refference outlet and variables
    
    @IBOutlet weak var tf_location: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_confirmpassword: UITextField!

    @IBOutlet weak var btn_man: UIButton!
    @IBOutlet weak var btn_woman: UIButton!

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tf_location.setLeftPaddingPoints(10)
        self.tf_email.setLeftPaddingPoints(10)
        self.tf_password.setLeftPaddingPoints(10)
        self.tf_confirmpassword.setLeftPaddingPoints(10)

        self.tf_location.setRightPaddingPoints(10)
        self.tf_email.setRightPaddingPoints(10)
        self.tf_password.setRightPaddingPoints(10)
        self.tf_confirmpassword.setRightPaddingPoints(10)
        
        self.btn_Manclick(self)
    }
}

// MARK: - IBAction's

extension CreateProfile2ViewController
{
    @IBAction func btn_Submitclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HealthDataViewController") as! HealthDataViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Manclick(_ sender: Any)
    {
        self.btn_man.layer.borderWidth = 4.0
        self.btn_man.layer.borderColor = UIColor(red: 236, green: 188, blue: 22).cgColor
        
        self.btn_woman.layer.borderWidth = 0.0
        self.btn_woman.layer.borderColor = UIColor.clear.cgColor
    }

    @IBAction func btn_Womanclick(_ sender: Any)
    {
        self.btn_woman.layer.borderWidth = 4.0
        self.btn_woman.layer.borderColor = UIColor(red: 236, green: 188, blue: 22).cgColor
        
        self.btn_man.layer.borderWidth = 0.0
        self.btn_man.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
