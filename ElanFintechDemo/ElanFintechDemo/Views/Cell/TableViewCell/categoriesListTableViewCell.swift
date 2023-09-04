//
//  categoriesListTableViewCell.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 03/09/23.
//

import UIKit

class categoriesListTableViewCell: UITableViewCell {
    static var cellIdentifier: String = {
       return "categoriesListTableViewCell"
    }()
    static var nibName: String = {
        return "categoriesListTableViewCell"
    }()
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblAmnt: UILabel!
    @IBOutlet weak var lblCategoryName: UILabel!
    @IBOutlet weak var lblTransactions: UILabel!
    @IBOutlet weak var viewImgContainer: UIView!
    
    @IBOutlet weak var btnCategoryIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewImgContainer.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 30
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
