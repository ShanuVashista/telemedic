//
//  HealthDataDetailsViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 04/04/22.
//

import UIKit

class HealthDataDetailsViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var viewDob: UIView!
    @IBOutlet weak var viewDobHeight: NSLayoutConstraint!
    @IBOutlet weak var relation: UILabel!
    @IBOutlet weak var lblRelation: UILabel!

    var isfrom = ""

    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
//        self.isfrom = "Details"
        
        if self.isfrom == "Details"{
            self.lblHeader.text! = "DETAILS"
            self.relation.text! = "Relation"
            self.lblRelation.text! = "Brother"
            self.lblEmail.text! = ""
            self.lblEmail.isHidden = true
            self.viewDob.isHidden = true
            self.viewDobHeight.constant = 0
        }else{
            self.lblHeader.text! = "PROFILE"
            self.lblEmail.text! = "marksmith@gmail.com"
            self.relation.text! = "Location"
            self.lblRelation.text! = "2184 Eglinton Avenue, Toronto"
            self.lblEmail.isHidden = false
            self.viewDob.isHidden = false
            self.viewDobHeight.constant = 72
        }
    }
}

// MARK: - IBAction's

extension HealthDataDetailsViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
