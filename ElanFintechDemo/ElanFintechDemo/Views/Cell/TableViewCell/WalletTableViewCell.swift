//
//  WalletTableViewCell.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 02/09/23.
//

import UIKit

class WalletTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblWelcomeBack: UILabel!
    @IBOutlet weak var viewWalletImgContainer: UIView!
    @IBOutlet weak var ImgWalletView: UIImageView!
    @IBOutlet weak var btnWallet: UIButton!
    @IBOutlet weak var lblBalanceNum: UILabel!
    @IBOutlet weak var lblTotalBalance: UILabel!
    @IBOutlet weak var lblMyWallet: UILabel!
    
    static var cellIdentifier: String = {
        return "WalletTableViewCell"
    }()
    static var nibName: String = {
        return "WalletTableViewCell"
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        viewWalletImgContainer.layer.cornerRadius = 30
        btnWallet.layer.cornerRadius = btnWallet.frame.height / 2
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
