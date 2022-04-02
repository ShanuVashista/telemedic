//
//  HealthDataViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 31/03/22.
//

import UIKit

class HealthDataViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var tf_weight: UITextField!
    @IBOutlet weak var tf_kg: UITextField!
    @IBOutlet weak var tf_height: UITextField!
    @IBOutlet weak var tf_cm: UITextField!
    @IBOutlet weak var tf_bmi: UITextField!
    @IBOutlet weak var tf_medicalcondition: UITextField!
    @IBOutlet weak var tf_pastmedicalcondition: UITextField!
    @IBOutlet weak var tf_allergies: UITextField!
    @IBOutlet weak var tf_medication: UITextField!
    
    @IBOutlet weak var btn_smokingYes: UIButton!
    @IBOutlet weak var btn_smokingNo: UIButton!
    @IBOutlet weak var btn_alcoholYes: UIButton!
    @IBOutlet weak var btn_alcoholNo: UIButton!
    @IBOutlet weak var btn_marijuanaYes: UIButton!
    @IBOutlet weak var btn_marijuanaNo: UIButton!

    var arrayWeight = ["Gm","Kg"]
    var arrayHeight = ["Feet","Inches","Cm"]

    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tf_weight.setLeftPaddingPoints(10)
        self.tf_kg.setLeftPaddingPoints(10)
        self.tf_height.setLeftPaddingPoints(10)
        self.tf_cm.setLeftPaddingPoints(10)
        self.tf_bmi.setLeftPaddingPoints(10)
        self.tf_medicalcondition.setLeftPaddingPoints(10)
        self.tf_pastmedicalcondition.setLeftPaddingPoints(10)
        self.tf_allergies.setLeftPaddingPoints(10)
        self.tf_medication.setLeftPaddingPoints(10)

        self.tf_weight.setRightPaddingPoints(10)
        self.tf_kg.setRightPaddingPoints(10)
        self.tf_height.setRightPaddingPoints(10)
        self.tf_cm.setRightPaddingPoints(10)
        self.tf_bmi.setRightPaddingPoints(10)
        self.tf_medicalcondition.setRightPaddingPoints(10)
        self.tf_pastmedicalcondition.setRightPaddingPoints(10)
        self.tf_allergies.setRightPaddingPoints(10)
        self.tf_medication.setRightPaddingPoints(10)

    }
}


// MARK: - IBAction's

extension HealthDataViewController
{
    @IBAction func btn_SmokingYesclick(_ sender: Any)
    {
        self.btn_smokingYes.setImage(UIImage(named: "circle_yellow"), for: .normal)
        self.btn_smokingNo.setImage(UIImage(named: "circle_gray"), for: .normal)
    }
    
    @IBAction func btn_SmokingNoclick(_ sender: Any)
    {
        self.btn_smokingNo.setImage(UIImage(named: "circle_yellow"), for: .normal)
        self.btn_smokingYes.setImage(UIImage(named: "circle_gray"), for: .normal)
    }
    
    @IBAction func btn_AlcoholYesclick(_ sender: Any)
    {
        self.btn_alcoholYes.setImage(UIImage(named: "circle_yellow"), for: .normal)
        self.btn_alcoholNo.setImage(UIImage(named: "circle_gray"), for: .normal)
    }
    
    @IBAction func btn_AlcoholNoclick(_ sender: Any)
    {
        self.btn_alcoholNo.setImage(UIImage(named: "circle_yellow"), for: .normal)
        self.btn_alcoholYes.setImage(UIImage(named: "circle_gray"), for: .normal)
    }
    
    @IBAction func btn_MarijuanaYesclick(_ sender: Any)
    {
        self.btn_marijuanaYes.setImage(UIImage(named: "circle_yellow"), for: .normal)
        self.btn_marijuanaNo.setImage(UIImage(named: "circle_gray"), for: .normal)
    }
    
    @IBAction func btn_MarijuanaNoclick(_ sender: Any)
    {
        self.btn_marijuanaNo.setImage(UIImage(named: "circle_yellow"), for: .normal)
        self.btn_marijuanaYes.setImage(UIImage(named: "circle_gray"), for: .normal)
    }
    
    @IBAction func btn_Kgarrowclick(_ sender: Any)
    {
        RPicker.pickOption(dataArray: self.arrayWeight) { value, atIndex in
            self.tf_kg.text = value
        }
    }
    
    @IBAction func btn_Cmarrowclick(_ sender: Any)
    {
        RPicker.pickOption(dataArray: self.arrayHeight) { value, atIndex in
            self.tf_cm.text = value
        }
    }
    
    @IBAction func btn_Submitclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectYourProfileViewController") as! SelectYourProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

// MARK: - Textfield Method

extension HealthDataViewController: UITextFieldDelegate
{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        if textField == tf_kg{            
            RPicker.pickOption(dataArray: self.arrayWeight) { value, atIndex in
                self.tf_kg.text = value
            }
            return false
        }
        if textField == tf_cm{
            RPicker.pickOption(dataArray: self.arrayHeight) { value, atIndex in
                self.tf_cm.text = value
            }
            return false
        }
        return true
    }
}
