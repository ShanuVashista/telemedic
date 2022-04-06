//
//  TestViewController.swift
//  TelemedicineApp
//
//  Created by Bhavik Darji on 05/04/22.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var view_test: UILabel!
    @IBOutlet weak var imgview: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let tapGR = UITapGestureRecognizer(target: self, action: #selector(tapped))
//        imgview.addGestureRecognizer(tapGR)

    }
    
//    @objc func tapped(gr:UITapGestureRecognizer) {
//        let loc:CGPoint = gr.location(in: gr.view)
//        self.getPixelColorAtPoint(point: loc, sourceView: self.imgview)
//    }

    
//    func getPixelColorAtPoint(point: CGPoint, sourceView: UIImageView) -> UIColor {
//        let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
//        let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
//
//        context!.translateBy(x: -point.x, y: -point.y)
//
//        sourceView.layer.render(in: context!)
//        let color: UIColor = UIColor(red: CGFloat(pixel[0])/255.0,
//                                     green: CGFloat(pixel[1])/255.0,
//                                     blue: CGFloat(pixel[2])/255.0,
//                                     alpha: CGFloat(pixel[3])/255.0)
//        pixel.deallocate(capacity: 4)
//        return color
//    }

}

