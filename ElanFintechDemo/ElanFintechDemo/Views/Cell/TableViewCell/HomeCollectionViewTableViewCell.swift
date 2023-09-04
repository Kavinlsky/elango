//
//  WalletTableViewCell.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 02/09/23.
//

import UIKit

class HomeCollectionViewTableViewCell: UITableViewCell {
    
    @IBOutlet var gContainerView: UIView!
    @IBOutlet var gCollectionView: UICollectionView!
    
    static var cellIdentifier: String = {
       return "HomeCollectionViewTableViewCell"
    }()
    static var nibName: String = {
        return "HomeCollectionViewTableViewCell"
    }()
let aArrImg = ["","img_1","img_2","img_3","img_4"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        gCollectionView.delegate = self
        gCollectionView.dataSource = self
    }
    
    fileprivate func setupViews() {
        gCollectionView.register(UINib(nibName: "HomeSpecalityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeSpecalityCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension HomeCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return aArrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 110, height: 140)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSpecalityCollectionViewCell.cellIdentifier, for: indexPath) as! HomeSpecalityCollectionViewCell
        if indexPath.row == 0 {
            aCell.gImgViewIcon.image = UIImage(named: "")
            aCell.imgPlus.isHidden = false
        } else {
            aCell.imgPlus.isHidden = true
            aCell.gImgViewIcon.image = UIImage(named: aArrImg[indexPath.row])
        }
       
        return aCell
    }
    
}
