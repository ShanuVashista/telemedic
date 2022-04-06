//
//  RescheduleAppoinmentViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 04/04/22.
//

import UIKit

class RescheduleAppoinmentViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var dateScrollPicker: DateScrollPicker!
    @IBOutlet weak var tf_time: UITextField!
    @IBOutlet weak var appointmentTypeview: UIView!
    @IBOutlet weak var btn_virtual: UIButton!
    @IBOutlet weak var btn_inperson: UIButton!
    @IBOutlet weak var lbl_month: UILabel!

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

// MARK: - IBAction's

extension RescheduleAppoinmentViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btn_Rescheduleclick(_ sender: Any)
    {
        
    }
    
    @IBAction func btn_Clockclick(_ sender: Any)
    {
        RPicker.selectDate(title: "Select time", cancelText: "Cancel", doneText: "Done", datePickerMode: .time, selectedDate: Date(), minDate: Date(), maxDate: Date(), style: .Wheel) { date in
            self.tf_time.text =  date.dateStringFromDate("h:mm a")
        }
    }
}

// MARK: - Textfield Method

extension RescheduleAppoinmentViewController: UITextFieldDelegate
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


// MARK: - Calandar Deleget

extension RescheduleAppoinmentViewController: DateScrollPickerDelegate
{
    func dateScrollPicker(_ dateScrollPicker: DateScrollPicker, didSelectDate date: Date)
    {
        print(date.format(dateFormat: "EEEE, dd MMMM yyyy"))
        self.lbl_month.text = date.format(dateFormat: "MMMM yyyy")
        if date.format(dateFormat: "dd MMMM yyyy") == Date().format(dateFormat: "dd MMMM yyyy")
        {
            print("Same")
        }
        else
        {
            print("Different")
        }
    }
}

