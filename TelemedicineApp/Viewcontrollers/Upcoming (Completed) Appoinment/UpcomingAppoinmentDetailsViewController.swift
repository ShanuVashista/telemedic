//
//  UpcomingAppoinmentDetailsViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 04/04/22.
//

import UIKit

class UpcomingAppoinmentDetailsViewController: UIViewController {

    // MARK: - Refference outlet and variables

    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - IBAction's

extension UpcomingAppoinmentDetailsViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
