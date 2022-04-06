//
//  AddHealthDataViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 04/04/22.
//

import UIKit

class AddHealthDataViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var imgview: UIImageView!
    
    @IBOutlet weak var tf_name: UITextField!
    @IBOutlet weak var tf_relation: UITextField!
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
    var arrayRelation = ["Mother","Father","Brother","Sister"]


    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgview.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer.init(target: self, action: #selector (ActionSheet_Photos))
        tapgesture.numberOfTapsRequired = 1
        self.imgview.addGestureRecognizer(tapgesture)
        self.imgview.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        
        self.tf_name.setLeftPaddingPoints(10)
        self.tf_relation.setLeftPaddingPoints(10)
        self.tf_weight.setLeftPaddingPoints(10)
        self.tf_kg.setLeftPaddingPoints(10)
        self.tf_height.setLeftPaddingPoints(10)
        self.tf_cm.setLeftPaddingPoints(10)
        self.tf_bmi.setLeftPaddingPoints(10)
        self.tf_medicalcondition.setLeftPaddingPoints(10)
        self.tf_pastmedicalcondition.setLeftPaddingPoints(10)
        self.tf_allergies.setLeftPaddingPoints(10)
        self.tf_medication.setLeftPaddingPoints(10)

        self.tf_name.setRightPaddingPoints(10)
        self.tf_relation.setRightPaddingPoints(10)
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

extension AddHealthDataViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Submitclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
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

    
}


// MARK: - Function's

extension AddHealthDataViewController
{
    @objc func ActionSheet_Photos()
    {
        let alert = UIAlertController(title: NSLocalizedString("Choose Option", comment: ""), message: "Select any option", preferredStyle: .actionSheet)
        
        let yesButton = UIAlertAction(title: NSLocalizedString("Choose From Gallery", comment: ""), style: .default, handler:
        { action in
            self.fromGallary()
        })
        
        let camerabutton = UIAlertAction(title: NSLocalizedString("Capture Photo", comment: ""), style: .default, handler:
        { action in
            self.camera()
        })
        
        let CancelButton = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { action in
        })
        
        alert.addAction(yesButton)
        alert.addAction(camerabutton)
        alert.addAction(CancelButton)
        
        present(alert, animated: true)
    }
}

// MARK: - Camera & Gallery Functions

extension AddHealthDataViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate
{
    func camera()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = .camera
        myPickerController.allowsEditing = true
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func fromGallary()
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[.editedImage] as? UIImage
        {
            self.imgview.layer.cornerRadius = 10.0
            self.imgview.clipsToBounds = true
            self.imgview.contentMode = .scaleToFill
            self.imgview.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Textfield Method

extension AddHealthDataViewController: UITextFieldDelegate
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
        if textField == tf_relation{
            RPicker.pickOption(dataArray: self.arrayRelation) { value, atIndex in
                self.tf_relation.text = value
            }
            return false
        }

        return true
    }
}
