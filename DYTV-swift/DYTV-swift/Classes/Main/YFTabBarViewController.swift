//
//  YFTabBarViewController.swift
//  DouYuTV-swift
//
//  Created by YangFan on 2016/12/28.
//  Copyright © 2016年 YangFan. All rights reserved.
//

import UIKit

class YFTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTabBar()
    }
}


//MARK: 添加底部tabbarItem
extension YFTabBarViewController {
    fileprivate func addTabBar() {
        addChildViewController(childVC: YFHomeViewController(), normalImageName: "tabHome", title: "首页")
        addChildViewController(childVC: YFLiveViewController(), normalImageName: "tabLiving", title: "直播")
        addChildViewController(childVC: YFAttentionViewController(), normalImageName: "tabFocus", title: "关注")
        addChildViewController(childVC: YFProfileViewController(), normalImageName: "tabMine", title: "我的")
    }
}

extension YFTabBarViewController {
    fileprivate func addChildViewController(childVC: UIViewController, normalImageName: String, title: String) {
        //        childVC.title = title
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: normalImageName)
        childVC.tabBarItem.selectedImage = UIImage(named: normalImageName + "HL")
        let nav = YFNavigationController(rootViewController: childVC)
        addChildViewController(nav)
    }

}








