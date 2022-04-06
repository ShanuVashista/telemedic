//
//  CompletedAppoinmentDetailsViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 04/04/22.
//

import UIKit

class CompletedAppoinmentDetailsViewController: UIViewController {

    // MARK: - Refference outlet and variables

    @IBOutlet weak var collectionview_prescription: UICollectionView!
    @IBOutlet weak var collectionview_result: UICollectionView!
    @IBOutlet weak var view_popup: UIView!
    @IBOutlet weak var view_popupHeight: NSLayoutConstraint!
    var ispopup = Bool()

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ispopup = false
        if ispopup == true{
            self.view_popup.isHidden = false
            self.view_popupHeight.constant = 140
        }else{
            self.view_popup.isHidden = true
            self.view_popupHeight.constant = 0
        }
    }
}

// MARK: - IBAction's

extension CompletedAppoinmentDetailsViewController
{
    @IBAction func btn_Backclick(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
}


// MARK: - Collectionview Method

extension CompletedAppoinmentDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.collectionview_prescription{
            return 2
        }else{
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if collectionView == self.collectionview_prescription{
            let cell = self.collectionview_prescription.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as!
            ImageCell
            return cell
        }else{
            let cell = self.collectionview_prescription.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as!
            ImageCell
            return cell
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 120.0, height: 120.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print(indexPath.row)
    }
}


// MARK: - Collectionview cell
class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var imgviewHeight: NSLayoutConstraint!
    @IBOutlet weak var name: UILabel!
    
}


