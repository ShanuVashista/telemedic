//
//  SelectProfileDetailsViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 31/03/22.
//

import UIKit

class SelectProfileDetailsViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var dateScrollPicker: DateScrollPicker!
    @IBOutlet weak var btn_Anydoctor: UIButton!
    @IBOutlet weak var btn_Choosedoctor: UIButton!
    @IBOutlet weak var tf_time: UITextField!
    @IBOutlet weak var appointmentTypeviewHeight: NSLayoutConstraint!
    @IBOutlet weak var onlyVirtualviewHeight: NSLayoutConstraint!
    @IBOutlet weak var appointmentTypeview: UIView!
    @IBOutlet weak var onlyVirtualview: UIView!
    @IBOutlet weak var btn_virtual: UIButton!
    @IBOutlet weak var btn_inperson: UIButton!
    @IBOutlet weak var lbl_month: UILabel!
    var doctor_type = "Any"

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tf_time.setLeftPaddingPoints(10)
        self.tf_time.setRightPaddingPoints(10)
        
        self.btn_virtual.titleLabel?.numberOfLines = 2
        self.btn_inperson.titleLabel?.numberOfLines = 2
        
        self.btn_virtual.setTitle("Virtual\nAppoinment", for: .normal)
        self.btn_inperson.setTitle("In Person\nAppoinment", for: .normal)
        
        self.btn_virtual.titleLabel?.textAlignment = .center
        self.btn_inperson.titleLabel?.textAlignment = .center
        
        self.lbl_month.text = Date().format(dateFormat: "MMMM yyyy")

        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.dateScrollPicker.selectToday()
            self.dateScrollPicker.delegate = self
        }
    }
}

// MARK: - Textfield Method

extension SelectProfileDetailsViewController: UITextFieldDelegate
{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        if textField == tf_time{
            RPicker.selectDate(title: "Select time", cancelText: "Cancel", doneText: "Done", datePickerMode: .time, selectedDate: Date(), minDate: Date(), maxDate: Date(), style: .Wheel) { date in
                self.tf_time.text =  date.dateStringFromDate("h:mm a")
            }
            return false
        }
        return true
    }
}


// MARK: - IBAction's

extension SelectProfileDetailsViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btn_Anydoctorclick(_ sender: Any)
    {
        self.doctor_type = "Any"
        self.btn_Anydoctor.setImage(UIImage(named: "circle_yellow"), for: .normal)
        self.btn_Choosedoctor.setImage(UIImage(named: "circle_gray"), for: .normal)
    }
    
    @IBAction func btn_Choosedoctorclick(_ sender: Any)
    {
        self.doctor_type = "Choose Doctor"
        self.btn_Choosedoctor.setImage(UIImage(named: "circle_yellow"), for: .normal)
        self.btn_Anydoctor.setImage(UIImage(named: "circle_gray"), for: .normal)
    }
    
    @IBAction func btn_Clockclick(_ sender: Any)
    {
        RPicker.selectDate(title: "Select time", cancelText: "Cancel", doneText: "Done", datePickerMode: .time, selectedDate: Date(), minDate: Date(), maxDate: Date(), style: .Wheel) { date in
            self.tf_time.text =  date.dateStringFromDate("h:mm a")
        }
    }
    
    @IBAction func btn_Nextclick(_ sender: Any)
    {
        if self.doctor_type == "Any"{
            let vc = storyboard?.instantiateViewController(withIdentifier: "BodyViewController") as! BodyViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DoctorListingViewController") as! DoctorListingViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}



// MARK: - Calandar Deleget

extension SelectProfileDetailsViewController: DateScrollPickerDelegate
{
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, didSelectDate date: Date)
    {
        print(date.format(dateFormat: "EEEE, dd MMMM yyyy"))
        self.lbl_month.text = date.format(dateFormat: "MMMM yyyy")

        if date.format(dateFormat: "dd MMMM yyyy") == Date().format(dateFormat: "dd MMMM yyyy")
        {
            print("Same")
            self.onlyVirtualview.isHidden = false
            self.appointmentTypeview.isHidden = true
            self.appointmentTypeviewHeight.constant = 60
            self.onlyVirtualviewHeight.constant = 60
        }
        else
        {
            print("Different")
            self.onlyVirtualview.isHidden = true
            self.appointmentTypeview.isHidden = false
            self.onlyVirtualviewHeight.constant = 136
            self.appointmentTypeviewHeight.constant = 136
        }
    }
}
