//
//  BodyReasonViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 01/04/22.
//

import UIKit

class BodyReasonViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblSubCategory: UILabel!

    var isfrom = ""

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.isfrom = "Appoinment"
        
        if self.isfrom == "Appoinment"{
            self.lblHeader.text! = "BOOK AN APPOINTMENT"
            self.lblSubCategory.text! = "Head & Neck"
            self.lblSubCategory.isHidden = false
        }else{
            self.lblHeader.text! = "OTHER DISEASES"
            self.lblSubCategory.text! = ""
            self.lblSubCategory.isHidden = true
        }
        self.tblview.estimatedRowHeight = 70

    }

}

// MARK: - IBAction's

extension BodyReasonViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Method

extension BodyReasonViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tblview.dequeueReusableCell(withIdentifier: "ReasonCell", for: indexPath) as! ReasonCell
        if self.isfrom == "Appoinment"{
            cell.tick.isHidden = false
        }else{
            cell.tick.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BodySubReasonViewController") as! BodySubReasonViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Tableview cell
class ReasonCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tick: UIImageView!

}
