//
//  ExpencesTableViewCell.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 02/09/23.
//

import UIKit
import ChartProgressBar

class ExpencesTableViewCell: UITableViewCell {

    @IBOutlet weak var chart: ChartProgressBar!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var mydata: [BarData] = []
    
    static var cellIdentifier: String = {
       return "ExpencesTableViewCell"
    }()
    static var nibName: String = {
        return "ExpencesTableViewCell"
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        initializedata()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initializedata() {
        mydata.removeAll()
        chart.removeValues()
        mydata.append(BarData.init(barTitle: "Mon", barValue: 1.4, pinText: "1.4$"))
        mydata.append(BarData.init(barTitle: "Tue", barValue: 10, pinText: "10$"))
        mydata.append(BarData.init(barTitle: "Wed", barValue: 3.1, pinText: "3.1$"))
        mydata.append(BarData.init(barTitle: "Thur", barValue: 4.8, pinText: "4.8$"))
        mydata.append(BarData.init(barTitle: "Fri", barValue: 6.6, pinText: "6.6$"))
        mydata.append(BarData.init(barTitle: "Sat", barValue: 7.4, pinText: "7.4$"))
        mydata.append(BarData.init(barTitle: "Sun", barValue: 5.5, pinText: "5.5$"))
        chart.data = mydata
        chart.barsCanBeClick = true
        chart.maxValue = 10.0
        
        chart.progressClickColor = GlobalStoryBoard().hexStringToUIColor(hex: "09467D")
        chart.build()
    }
    

    
}
