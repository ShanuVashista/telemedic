//
//  BookAppoinmentViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 30/03/22.
//

import UIKit

class DoctorListingViewController: UIViewController {

    // MARK: - Refference outlet and variables
    
    @IBOutlet weak var tblview: UITableView!
    var selected = 0

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblview.estimatedRowHeight = 100

    }
}

// MARK: - IBAction's

extension DoctorListingViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Choosemethodclick(_ sender: Any)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChooseMethodViewController") as! ChooseMethodViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}



// MARK: - Tableview Method

extension DoctorListingViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tblview.dequeueReusableCell(withIdentifier: "DoctorCell", for: indexPath) as! DoctorCell
        if selected == indexPath.row
        {
            cell.tick.isHidden = false
        }
        else
        {
            cell.tick.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.selected = indexPath.row
        self.tblview.reloadData()
    }
}


// MARK: - Tableview cell
class DoctorCell: UITableViewCell {
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var speciality: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var tick: UIImageView!
    @IBOutlet weak var mark: UILabel!
}
