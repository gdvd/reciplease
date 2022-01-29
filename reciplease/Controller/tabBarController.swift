//
//  UITabBarController+Ext.swift
//  reciplease
//
//  Created by Gilles David on 26/01/2022.
//

import Foundation
import UIKit


class tabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        
        self.tabBar.layer.borderColor = UIColor.gray.cgColor
        self.tabBar.layer.borderWidth = 1

        self.tabBar.itemPositioning = .fill
        addSeparatorToTabBar(width: 1)
        setFont(fontSize: 24)
    }
    
    fileprivate func setFont(fontSize: CGFloat) {

        if let items = self.tabBar.items {

            let selectedTitleFont = UIFont(name: "NanumPenScript-Regular" , size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.bold)
            for item in items {
                item.setTitleTextAttributes([NSAttributedString.Key.font: selectedTitleFont], for: UIControl.State.normal)
            }
        }
    }
    
    fileprivate func addSeparatorToTabBar(width : CGFloat) {
        if let items = self.tabBar.items {
            let height = self.tabBar.bounds.height
            let numItems = CGFloat(items.count)
            let itemSize = CGSize(
                width: (self.tabBar.frame.width) / numItems,
                height: (self.tabBar.frame.height))
            for (index, _) in items.enumerated() {
                if index > 0 {
                    let xPosition = itemSize.width * CGFloat(index)
                    let separator = UIView(frame: CGRect(
                        x: xPosition, y: 0, width: width, height: height))
                    separator.backgroundColor = UIColor.gray
                    self.tabBar.insertSubview(separator, at: 1)
                }
            }
        }
    }
    
}
