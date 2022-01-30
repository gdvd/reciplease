//
//  NavigationController.swift
//  reciplease
//
//  Created by Gilles David on 29/01/2022.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        offset()
    }

    func offset() {
        
        //self.navigationBar.setTitleVerticalPositionAdjustment(CGFloat(4.333333), for: .default)
        /*AVEC 4.333333 => <UILabel: 0x7f8914f18710; frame = (135.667 0; 119 40.3333); text = 'Reciplease'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x60000339a670>> */
        /*AVEC 5 => <UILabel: 0x7f91970129c0; frame = (135.667 0.666667; 119 40.3333); text = 'Reciplease'; userInteractionEnabled = NO; layer = <_UILabelLayer: 0x60000142b020>> */
        
        //print("================",self.navigationBar.titleTextAttributes?.description)
        //self.navigationBar.layer.
        //UINavigationController().navigationBar.layer.backgroundColor = UIColor.blue.cgColor
        //self.navigationBar.titleTextAttributes.
        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]

    }
}
