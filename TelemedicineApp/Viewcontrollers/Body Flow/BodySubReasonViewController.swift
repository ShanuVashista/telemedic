//
//  BodySubReasonViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 01/04/22.
//

import UIKit

class BodySubReasonViewController: UIViewController {

    // MARK: - Refference outlet and variables
    
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var lblTop: UILabel!
    @IBOutlet weak var lblBottom: UILabel!
    @IBOutlet weak var lblTitle: UILabel!

    var array_selectedIndex = [Int]()
    var selected_index = Int()
    var isfrom = ""

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.isfrom = "Appoinment"

        if self.isfrom == "Appoinment"{
            self.lblTop.text! = ""
            self.lblBottom.text! = "Select major 5 symptoms"
            self.lblTitle.text! = "In your problem accompanied by new and unfamiliar symptoms such as:"
            self.lblTop.isHidden = true
            self.lblBottom.isHidden = false
        }else{
            self.lblTop.text! = "Psychiatry"
            self.lblBottom.text! = ""
            self.lblTitle.text! = "Now choose the main reason for your consultation?"
            self.lblTop.isHidden = false
            self.lblBottom.isHidden = true
        }

        self.tblview.estimatedRowHeight = 70

    }
}

// MARK: - IBAction's

extension BodySubReasonViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Continueclick(_ sender: Any)
    {
        
    }

}

// MARK: - Tableview Method

extension BodySubReasonViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tblview.dequeueReusableCell(withIdentifier: "SubReasonCell", for: indexPath) as! SubReasonCell
        
        if self.isfrom == "Appoinment"{
            if self.array_selectedIndex.contains(indexPath.row){
                cell.box.image = UIImage(named: "select")
            }else{
                cell.box.image = UIImage(named: "unselect")
            }
        }else{
            if self.selected_index == indexPath.row{
                cell.box.image = UIImage(named: "select")
            }else{
                cell.box.image = UIImage(named: "")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if self.isfrom == "Appoinment"{
            if self.array_selectedIndex.contains(indexPath.row){
                let index: Int = self.array_selectedIndex.firstIndex(where: {$0 == indexPath.row})!
                self.array_selectedIndex.remove(at: index)
            }else{
                self.array_selectedIndex.append(indexPath.row)
            }
            self.tblview.reloadData()
        }else{
            self.selected_index = indexPath.row
            self.tblview.reloadData()
        }
    }
}

// MARK: - Tableview cell
class SubReasonCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var box: UIImageView!
}
