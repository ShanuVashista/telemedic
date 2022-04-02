//
//  MyCardsViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 01/04/22.
//

import UIKit

class MyCardsViewController: UIViewController {

    // MARK: - Refference outlet and variables
    @IBOutlet weak var tblview: UITableView!
    var selected_index = 0

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

// MARK: - IBAction's

extension MyCardsViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Tableview Method

extension MyCardsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tblview.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        if self.selected_index == indexPath.row{
            cell.imgview_tick.image = UIImage(named: "greentick")
        }else{
            cell.imgview_tick.image = UIImage(named: "gray_tick")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.selected_index = indexPath.row
        self.tblview.reloadData()
    }
}


// MARK: - Tableview cell
class CardCell: UITableViewCell {
    
    @IBOutlet weak var imgview_card: UIImageView!
    @IBOutlet weak var imgview_tick: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!

}
