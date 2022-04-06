//
//  AddCardViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 01/04/22.
//

import UIKit

class AddCardViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var tf_cardtype: UITextField!
    @IBOutlet weak var tf_cardholdername: UITextField!
    @IBOutlet weak var tf_cardnumber: UITextField!
    @IBOutlet weak var tf_cvv: UITextField!

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tf_cardtype.setLeftPaddingPoints(10)
        self.tf_cardholdername.setLeftPaddingPoints(10)
        self.tf_cardnumber.setLeftPaddingPoints(10)
        self.tf_cvv.setLeftPaddingPoints(10)
        
        self.tf_cardtype.setRightPaddingPoints(10)
        self.tf_cardholdername.setRightPaddingPoints(10)
        self.tf_cardnumber.setRightPaddingPoints(10)
        self.tf_cvv.setRightPaddingPoints(10)
    }
}


// MARK: - IBAction's

extension AddCardViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Submitclick(_ sender: Any)
    {
        
    }
}
