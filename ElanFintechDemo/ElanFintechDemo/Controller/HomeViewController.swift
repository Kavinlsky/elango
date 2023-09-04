//
//  HomeViewController.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 02/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var myTblView: UITableView!
    @IBOutlet weak var btnLeftMenu: UIButton!
    @IBOutlet weak var btnProfile: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
    }
    
    fileprivate func initializeUI() {
        btnProfile.layer.cornerRadius = 15
        myTblView.delegate = self
        myTblView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
        myTblView.register(UINib.init(nibName: WalletTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: WalletTableViewCell.cellIdentifier)
        myTblView.register(UINib.init(nibName: HomeCollectionViewTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: HomeCollectionViewTableViewCell.cellIdentifier)
        myTblView.register(UINib.init(nibName: SavingsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: SavingsTableViewCell.cellIdentifier)
    }
    
        
    // MARK: - Tapped button action
    @objc func leftBtnTapped () {

    }
   
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 350
        case 1:
            return 110
        default:
            return 400
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let aCell = myTblView.dequeueReusableCell(withIdentifier:WalletTableViewCell.cellIdentifier , for: indexPath) as! WalletTableViewCell
            return aCell
            
        case 1:
            let aCell = myTblView.dequeueReusableCell(withIdentifier:HomeCollectionViewTableViewCell.cellIdentifier , for: indexPath) as! HomeCollectionViewTableViewCell
            return aCell
        default:
            let aCell = myTblView.dequeueReusableCell(withIdentifier:SavingsTableViewCell.cellIdentifier , for: indexPath) as! SavingsTableViewCell
            aCell.lblSeeAll.addTarget(self, action: #selector(seeAllBtnTapped), for: .touchUpInside)
            return aCell
        }
    }
    
    @objc func seeAllBtnTapped(sender: UIButton) {
        let aViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StatisticsViewController") as! StatisticsViewController
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(aViewController, animated: true)

    }
    
}
