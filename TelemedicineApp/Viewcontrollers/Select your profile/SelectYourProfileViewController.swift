//
//  SelectYourProfileViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 30/03/22.
//

import UIKit

class SelectYourProfileViewController: UIViewController {
    
    // MARK: - Refference outlet and variables
    
    @IBOutlet weak var collectionview: UICollectionView!

    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - IBAction's

extension SelectYourProfileViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}


// MARK: - Collectionview Method

extension SelectYourProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = self.collectionview.dequeueReusableCell(withReuseIdentifier: "SelectProfileCell", for: indexPath) as!
        SelectProfileCell
        cell.imgviewHeight.constant = collectionview.frame.width / 3 - 20
        cell.imgview.cornerRadius = (collectionview.frame.width / 3 - 20) / 2
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionview.frame.width / 3 - 20, height: collectionview.frame.width / 3 - 20 + 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectProfileDetailsViewController") as! SelectProfileDetailsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - Collectionview cell
class SelectProfileCell: UICollectionViewCell {
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var imgviewHeight: NSLayoutConstraint!
    @IBOutlet weak var name: UILabel!
    
}
