//
//  AppoinmentBookedPopupViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 01/04/22.
//

import UIKit

class AppoinmentBookedPopupViewController: UIViewController {

    // MARK: - Refference outlet and variables


    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - IBAction's

extension AppoinmentBookedPopupViewController
{
    @IBAction func btn_Hiddenclick(_ sender: Any)
    {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn_Okayclick(_ sender: Any)
    {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
