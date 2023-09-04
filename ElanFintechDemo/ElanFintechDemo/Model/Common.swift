//
//  Common.swift
//  ElanFintechDemo
//
//  Created by Dreamguys on 02/09/23.
//

import Foundation
import UIKit


private let MAINSTORYBOARD = UIStoryboard(name: "Main", bundle: nil)

private let STORYBOARD_ID_HOME_VC = "HomeViewController"
private let STORYBOARD_ID_STATISTICS_VC = "StatisticsViewController"
final class GlobalStoryBoard: NSObject {
    
    //Mark: -View Controller
    
    var HomeVC : HomeViewController {
        return MAINSTORYBOARD.instantiateViewController(withIdentifier: STORYBOARD_ID_HOME_VC) as! HomeViewController
    }
    var StatisticsVC : StatisticsViewController {
        return MAINSTORYBOARD.instantiateViewController(withIdentifier: STORYBOARD_ID_STATISTICS_VC) as! StatisticsViewController
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
