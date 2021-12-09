//
//  FinalPage.swift
//  UIElements
//
//  Created by DCS on 09/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class FinalPage: UIViewController {

    private let tabBar:UITabBar={
        let tabBar=UITabBar()
        let item1=UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        let item2=UITabBarItem(tabBarSystemItem: .mostViewed, tag: 2)
        tabBar.items=[item1,item2]
        return tabBar
    }()
    
    func addSegment(){
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .white
        view.addSubview(tabBar)
        let mySegmentedControl = UISegmentedControl (items: ["Home","Profile Details"])
        mySegmentedControl.frame = CGRect(x:20, y: 100, width: view.width-40, height: 30)
        mySegmentedControl.selectedSegmentIndex = 1
        mySegmentedControl.tintColor = UIColor.blue
        
        self.view.addSubview(mySegmentedControl)
        
    }
    
    override func viewDidLayoutSubviews() {
        let tabBarHeight:CGFloat=view.safeAreaInsets.top + 49.0
        tabBar.frame=CGRect(x: 0, y: view.frame.size.height-tabBarHeight, width: view.frame.size.width, height: tabBarHeight)
        
        
    }
}
extension ViewController:UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}
