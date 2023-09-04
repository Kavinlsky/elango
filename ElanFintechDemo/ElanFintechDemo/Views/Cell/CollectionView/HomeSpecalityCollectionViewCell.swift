//
//  WalletTableViewCell.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 02/09/23.
//

import UIKit

class HomeSpecalityCollectionViewCell: UICollectionViewCell {

    @IBOutlet var gContainerView: UIView!
    @IBOutlet var gLblName: UILabel!
    @IBOutlet var gImgViewIcon: UIImageView!
    @IBOutlet var gViewIcon: UIView!
    @IBOutlet weak var gViewImgContainer: UIView!
    @IBOutlet weak var imgPlus: UIImageView!
    
    static var cellIdentifier: String = {
        return "HomeSpecalityCollectionViewCell"
    }()
    static var nibName: String = {
        return "HomeSpecalityCollectionViewCell"
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        gViewImgContainer.layer.cornerRadius = 20
        gViewIcon.layer.cornerRadius = 30
        gViewIcon.layer.borderWidth = 1
        gViewIcon.layer.borderColor = GlobalStoryBoard().hexStringToUIColor(hex: "c7ab73").cgColor
    }
    
   

}
