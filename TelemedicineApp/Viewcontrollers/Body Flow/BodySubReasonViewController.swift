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
    var array_selectedIndex = [Int]()

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

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
        if self.array_selectedIndex.contains(indexPath.row){
            cell.box.image = UIImage(named: "select")
        }else{
            cell.box.image = UIImage(named: "unselect")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if self.array_selectedIndex.contains(indexPath.row){
            let index: Int = self.array_selectedIndex.firstIndex(where: {$0 == indexPath.row})!
            self.array_selectedIndex.remove(at: index)
        }else{
            self.array_selectedIndex.append(indexPath.row)
        }
        self.tblview.reloadData()
    }
}

// MARK: - Tableview cell
class SubReasonCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var box: UIImageView!
}
