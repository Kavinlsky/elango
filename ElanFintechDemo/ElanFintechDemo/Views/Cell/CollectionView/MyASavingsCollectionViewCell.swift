//
//  MyASavingsCollectionViewCell1.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 03/09/23.
//

import UIKit

class MyASavingsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myLblSavingName: UILabel!
    @IBOutlet weak var btnRightArrow: UIButton!
    @IBOutlet weak var lblSavingAmnt: UILabel!
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var viewContainer: UIView!
    static var cellIdentifier: String = {
       return "MyASavingsCollectionViewCell"
    }()
    static var nibName: String = {
        return "MyASavingsCollectionViewCell"
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        viewContainer.layer.cornerRadius = 20
        viewContainer.layer.borderWidth = 1
        viewContainer.layer.borderColor = UIColor.lightGray.cgColor
        // Initialization code
    }

}
