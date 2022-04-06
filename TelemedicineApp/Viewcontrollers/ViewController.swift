import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var numberOfCells = 6
    var lastRotation: CGFloat = 0
    @IBOutlet weak var collectionView: UICollectionView!
    var arr = ["crop_yellow","crop_blue","crop_red","crop_yellow","crop_blue","crop_red"]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = CircleLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        let rotationGesture = UIRotationGestureRecognizer(target: self, action:     #selector(rotationRecognized(_:)))
        collectionView.addGestureRecognizer(rotationGesture)

    }

    @objc func rotationRecognized(_ sender: UIRotationGestureRecognizer) {

        if sender.state == .began {
            print("begin")
            sender.rotation = lastRotation
        } else if sender.state == .changed {
            print("changing")
            let newRotation = sender.rotation + lastRotation
            collectionView.transform = CGAffineTransform(rotationAngle: newRotation)
        } else if sender.state == .ended {
            print("end")
            lastRotation = sender.rotation
        }
    }

    // update collection view if size changes (e.g. rotate device)

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition(in: view, animation: { _ in
            self.collectionView?.performBatchUpdates(nil)
        })
    }
}

// MARK: UICollectionViewDataSource

extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CircleCell", for: indexPath) as! CircleCell
        cell.imgview.image = UIImage(named: "\(self.arr[indexPath.row])")
        return cell
    }
}



// MARK: - Tableview cell
class CircleCell: UICollectionViewCell {

    @IBOutlet weak var imgview: UIImageView!

}
