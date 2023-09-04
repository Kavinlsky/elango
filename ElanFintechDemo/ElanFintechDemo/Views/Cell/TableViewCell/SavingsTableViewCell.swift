//
//  SavingsTableViewCell.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 02/09/23.
//

import UIKit

class SavingsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblSeeAll: UIButton!
    @IBOutlet weak var llbSavings: UILabel!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    static var cellIdentifier: String = {
       return "SavingsTableViewCell"
    }()
    static var nibName: String = {
        return "SavingsTableViewCell"
    }()
    var myArrSavings = [[String:String]]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myArrSavings = [["name" : "Iphone 13 Mini", "price" : "699","color" : "ef9075"],["name" : "Macbook Pro M1", "price" : "1,499","color" : "4da880"],["name" : "Car", "price" : "20,000","color" : "f8dca2"],["name" : "House", "price" : "30,500","color" : "35244c"]]
    }
    
    fileprivate func setupViews() {
        myCollectionView.register(UINib(nibName: "MyASavingsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyASavingsCollectionViewCell")
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
}

extension SavingsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArrSavings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.frame.size.width) / 2 ) , height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: MyASavingsCollectionViewCell.cellIdentifier, for: indexPath) as! MyASavingsCollectionViewCell
        aCell.myLblSavingName.text = myArrSavings[indexPath.row]["name"]
        aCell.lblSavingAmnt.text = "$ " + (myArrSavings[indexPath.row]["price"] ?? "")
        aCell.myProgressView.barHeight = 5
        aCell.myProgressView.clipsToBounds = true
        aCell.myProgressView.layer.cornerRadius = 2
        aCell.myProgressView.tintColor = GlobalStoryBoard().hexStringToUIColor(hex: myArrSavings[indexPath.row]["color"] ?? "35244c")
        return aCell
    }
    
}
extension UIProgressView {

    @IBInspectable var barHeight : CGFloat {
        get {
            return transform.d * 2.0
        }
        set {
            let heightScale = newValue / 2.0
            let c = center
            transform = CGAffineTransformMakeScale(1.0, heightScale)
            center = c
        }
    }
}
