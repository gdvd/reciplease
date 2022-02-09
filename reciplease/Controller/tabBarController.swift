//
//  UITabBarController+Ext.swift
//  reciplease
//
//  Created by Gilles David on 26/01/2022.
//

import Foundation
import UIKit


class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        self.tabBar.itemPositioning = .fill
        addSeparatorToTabBar(sizeBorder: 2, color: UIColor.darkGray)
        setFont(fontSize: 42, fontName: "NanumPen")
    }
    
    fileprivate func setFont(fontSize: CGFloat, fontName: String) {
        
        if let items = self.tabBar.items {
            
            let customFont = UIFont(name: fontName , size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.bold)
            
            for item in items {
                item.setTitleTextAttributes([NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor:UIColor.white], for: .selected)
                item.setTitleTextAttributes([NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor:UIColor.darkGray], for: .normal)
            }
            
        }
    }
    
    fileprivate func addSeparatorToTabBar(sizeBorder : CGFloat, color: UIColor) {
        if let items = self.tabBar.items {
            
            // Separator up
            let widthBound = self.tabBar.bounds.width
            let separatorUp = UIView(frame: CGRect(
                x: 0, y: 0, width: widthBound, height: sizeBorder))
            separatorUp.backgroundColor = color
            self.tabBar.insertSubview(separatorUp, at: 1)
            
            // Separator between each tabBarItem
            let height = self.tabBar.bounds.height
            let numItems = CGFloat(items.count)
            let itemSize = CGSize(
                width: (self.tabBar.frame.width) / numItems,
                height: (self.tabBar.frame.height))
            for (index, _) in items.enumerated() {
                if index > 0 {
                    let xPosition = itemSize.width * CGFloat(index)
                    let separator = UIView(frame: CGRect(
                        x: xPosition, y: 0, width: sizeBorder, height: height))
                    separator.backgroundColor = color
                    self.tabBar.insertSubview(separator, at: 2)
                }
            }
        }
    }
    
}
