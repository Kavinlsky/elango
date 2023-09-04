//
//  StatisticsViewController.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 02/09/23.
//

import UIKit
import ChartProgressBar

class StatisticsViewController: UIViewController {

  
    @IBOutlet weak var tblView: UITableView!
    var mydata: [BarData] = []
    var mySelectedIndex = 0
    var myArrCategories = [[String : String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib.init(nibName: ExpencesTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ExpencesTableViewCell.cellIdentifier)
        tblView.register(UINib.init(nibName: categoriesListTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: categoriesListTableViewCell.cellIdentifier)
        // Do any additional setup after loading the view.
        myArrCategories = [["name" : "Shopping", "price" : "699","color" : "fadba2","transaction" : "17","img" : "icon_buy"],
                           ["name" : "Food", "price" : "1,499","color" : "efe4fc","transaction" : "12","img" : "icon_food"],
                           ["name" : "Entertainment", "price" : "20,000","color" : "fbd4ca","transaction" : "10","img" : "icon_entertainment"],
                           ["name" : "Medical", "price" : "30,500","color" : "9eafef","transaction" : "7","img" : "icon_food"]]
    }
    
    @IBAction func backBtnOnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension StatisticsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return myArrCategories.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 30
        }
        return 0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 5, width: headerView.frame.width, height: headerView.frame.height)
        label.text = "Categories"
        label.textColor = .black

      headerView.addSubview(label)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 400
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let aCell = tblView.dequeueReusableCell(withIdentifier:ExpencesTableViewCell.cellIdentifier , for: indexPath) as! ExpencesTableViewCell
            mydata.removeAll()
            if mySelectedIndex == 1 {
                mydata.append(BarData.init(barTitle: "Jan", barValue: 1.4, pinText: "1.4$"))
                mydata.append(BarData.init(barTitle: "Feb", barValue: 10, pinText: "10$"))
                mydata.append(BarData.init(barTitle: "Mar", barValue: 3.1, pinText: "3.1$"))
                mydata.append(BarData.init(barTitle: "Apr", barValue: 4.8, pinText: "4.8$"))
                mydata.append(BarData.init(barTitle: "May", barValue: 6.6, pinText: "6.6$"))
                mydata.append(BarData.init(barTitle: "Jun", barValue: 7.4, pinText: "7.4$"))
                mydata.append(BarData.init(barTitle: "Jul", barValue: 5.5, pinText: "5.5$"))
                
            } else {
                mydata.append(BarData.init(barTitle: "Mon", barValue: 1.4, pinText: "1.4$"))
                mydata.append(BarData.init(barTitle: "Tue", barValue: 10, pinText: "10$"))
                mydata.append(BarData.init(barTitle: "Wed", barValue: 3.1, pinText: "3.1$"))
                mydata.append(BarData.init(barTitle: "Thur", barValue: 4.8, pinText: "4.8$"))
                mydata.append(BarData.init(barTitle: "Fri", barValue: 6.6, pinText: "6.6$"))
                mydata.append(BarData.init(barTitle: "Sat", barValue: 7.4, pinText: "7.4$"))
                mydata.append(BarData.init(barTitle: "Sun", barValue: 5.5, pinText: "5.5$"))
            }
            aCell.segment.selectedSegmentIndex = mySelectedIndex
            aCell.chart.data = mydata
            aCell.chart.barsCanBeClick = true
            aCell.chart.maxValue = 10.0
            
            aCell.segment.selectedSegmentTintColor = GlobalStoryBoard().hexStringToUIColor(hex: "09467D")
            aCell.chart.progressColor = GlobalStoryBoard().hexStringToUIColor(hex: "09467D")
            aCell.chart.progressClickColor = GlobalStoryBoard().hexStringToUIColor(hex: "09467D")
            aCell.chart.build()
            aCell.segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
            return aCell
        } else {
            let aCell = tblView.dequeueReusableCell(withIdentifier:categoriesListTableViewCell.cellIdentifier , for: indexPath) as! categoriesListTableViewCell
            aCell.lblAmnt.text = "-$" + (myArrCategories[indexPath.row]["price"] ?? "")
            aCell.lblTransactions.text =  (myArrCategories[indexPath.row]["transaction"] ?? "") + "  transactions"
            aCell.lblCategoryName.text =  (myArrCategories[indexPath.row]["name"] ?? "")
            aCell.viewImgContainer.backgroundColor = GlobalStoryBoard().hexStringToUIColor(hex: myArrCategories[indexPath.row]["color"] ?? "")
            aCell.btnCategoryIcon?.image = UIImage(named: myArrCategories[indexPath.row]["img"] ?? "")
            return aCell
        }
    }
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        mySelectedIndex = sender.selectedSegmentIndex
        tblView.reloadData()
        
    }
    
}
