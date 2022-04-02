//
//  CreateProfile1ViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 30/03/22.
//

import UIKit

class CreateProfile1ViewController: UIViewController {
    
    // MARK: - Refference outlet and variables
    
    @IBOutlet weak var tf_firstname: UITextField!
    @IBOutlet weak var tf_lastname: UITextField!
    @IBOutlet weak var tf_age: UITextField!
    @IBOutlet weak var imgview: UIImageView!
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgview.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer.init(target: self, action: #selector (ActionSheet_Photos))
        tapgesture.numberOfTapsRequired = 1
        self.imgview.addGestureRecognizer(tapgesture)
        
        self.tf_firstname.setLeftPaddingPoints(10)
        self.tf_lastname.setLeftPaddingPoints(10)
        self.tf_age.setLeftPaddingPoints(10)

        self.tf_firstname.setRightPaddingPoints(10)
        self.tf_lastname.setRightPaddingPoints(10)
        self.tf_age.setRightPaddingPoints(10)
        
    }
    
}


// MARK: - IBAction's

extension CreateProfile1ViewController
{
    @IBAction func btn_Nextclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CreateProfile2ViewController") as! CreateProfile2ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Calenderclick(_ sender: Any)
    {
        RPicker.selectDate(title: "Select Date", didSelectDate: {[weak self] (selectedDate) in
            self?.tf_age.text = selectedDate.dateStringFromDate("dd MMM, YYYY")
        })
    }
    
    @objc func click()
    {
        self.ActionSheet_Photos()
    }
}

// MARK: - Textfield Method

extension CreateProfile1ViewController: UITextFieldDelegate
{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        if textField == tf_age{
            RPicker.selectDate(title: "Select Date", didSelectDate: {[weak self] (selectedDate) in
                self?.tf_age.text = selectedDate.dateStringFromDate("dd MMM, YYYY")
            })
            return false
        }
        return true
    }
}



// MARK: - Function's

extension CreateProfile1ViewController
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

extension CreateProfile1ViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate
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
            self.imgview.contentMode = .scaleAspectFill
            self.imgview.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
}

