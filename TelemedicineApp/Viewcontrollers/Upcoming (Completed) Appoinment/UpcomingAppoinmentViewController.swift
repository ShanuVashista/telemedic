//
//  UpcomingAppoinmentViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 04/04/22.
//

import UIKit

class UpcomingAppoinmentViewController: UIViewController {

    // MARK: - Refference outlet and variables
    
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var lblHeader: UILabel!
    var isfrom = "Upcoming"

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblview.estimatedRowHeight = 100
        
        if self.isfrom == "Upcoming"{
            self.lblHeader.text! = "UPCOMING APPOINTMENT"
        }else{
            self.lblHeader.text! = "COMPLETED APPOINTMENT"
        }
    }
}

// MARK: - IBAction's

extension UpcomingAppoinmentViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Method

extension UpcomingAppoinmentViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tblview.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorCell
        if self.isfrom == "Upcoming"{
            cell.mark.isHidden = true
        }else{
            cell.mark.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath.row)
    }
}
