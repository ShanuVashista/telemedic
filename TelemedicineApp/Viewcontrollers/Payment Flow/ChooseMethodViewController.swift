//
//  ChooseMethodViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 01/04/22.
//

import UIKit

class ChooseMethodViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var btn_healthcard: UIButton!
    @IBOutlet weak var btn_privateinsurance: UIButton!
    @IBOutlet weak var btn_privatepayment: UIButton!
    @IBOutlet weak var tf_time: UITextField!
    @IBOutlet weak var view_number: UIView!
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var view_privatepayment: UIView!

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        self.btn_healthcard.titleLabel?.numberOfLines = 2
        self.btn_privateinsurance.titleLabel?.numberOfLines = 2
        self.btn_privatepayment.titleLabel?.numberOfLines = 2

        self.btn_healthcard.setTitle("Health\nCard", for: .normal)
        self.btn_privateinsurance.setTitle("Private\nInsurance", for: .normal)
        self.btn_privatepayment.setTitle("Private\nPayment", for: .normal)

        self.btn_healthcard.titleLabel?.textAlignment = .center
        self.btn_privateinsurance.titleLabel?.textAlignment = .center
        self.btn_privatepayment.titleLabel?.textAlignment = .center
        
        self.btn_healthcard.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btn_privateinsurance.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        self.btn_privatepayment.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)

        self.tf_time.setLeftPaddingPoints(10)
        self.tf_time.setRightPaddingPoints(10)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.btn_Heathcardclick(self)
        }
    }
}

// MARK: - IBAction's

extension ChooseMethodViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Submitclick(_ sender: Any)
    {
        
    }

    @IBAction func btn_Heathcardclick(_ sender: Any)
    {
        self.btn_healthcard.titleLabel?.textColor = .white
        self.btn_privateinsurance.titleLabel?.textColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privatepayment.titleLabel?.textColor = UIColor(red: 65, green: 125, blue: 231)
        
        self.btn_healthcard.tintColor = .white
        self.btn_privateinsurance.tintColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privatepayment.tintColor = UIColor(red: 65, green: 125, blue: 231)
        
        self.btn_healthcard.backgroundColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privateinsurance.backgroundColor = .white
        self.btn_privatepayment.backgroundColor = .white
        
        self.view_number.isHidden = false
        self.view_privatepayment.isHidden = true

    }
    
    @IBAction func btn_Privateinsuranceclick(_ sender: Any)
    {
        self.btn_healthcard.titleLabel?.textColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privateinsurance.titleLabel?.textColor = .white
        self.btn_privatepayment.titleLabel?.textColor = UIColor(red: 65, green: 125, blue: 231)
        
        self.btn_healthcard.tintColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privateinsurance.tintColor = .white
        self.btn_privatepayment.tintColor = UIColor(red: 65, green: 125, blue: 231)
        
        self.btn_healthcard.backgroundColor = .white
        self.btn_privateinsurance.backgroundColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privatepayment.backgroundColor = .white
        
        self.view_number.isHidden = false
        self.view_privatepayment.isHidden = true
    }

    @IBAction func btn_Privatepaymentclick(_ sender: Any)
    {
        self.btn_healthcard.titleLabel?.textColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privateinsurance.titleLabel?.textColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privatepayment.titleLabel?.textColor = .white
        
        self.btn_healthcard.tintColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privateinsurance.tintColor = UIColor(red: 65, green: 125, blue: 231)
        self.btn_privatepayment.tintColor = .white
        
        self.btn_healthcard.backgroundColor = .white
        self.btn_privateinsurance.backgroundColor = .white
        self.btn_privatepayment.backgroundColor = UIColor(red: 65, green: 125, blue: 231)
        
        self.view_number.isHidden = true
        self.view_privatepayment.isHidden = false
    }
}


// MARK: - Tableview Method

extension ChooseMethodViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tblview.dequeueReusableCell(withIdentifier: "PaymentMethodCell", for: indexPath) as! PaymentMethodCell
        cell.view.addShadow(offset: CGSize(width: 1.0, height: 1.0), color: .gray, radius: 5.0, opacity: 0.5)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print(indexPath.row)
    }
}


// MARK: - Tableview cell
class PaymentMethodCell: UITableViewCell {
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var view: UIView!

}
