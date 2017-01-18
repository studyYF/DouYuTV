//
//  YFHomeViewController.swift
//  DouYuTV-swift
//
//  Created by YangFan on 2016/12/28.
//  Copyright © 2016年 YangFan. All rights reserved.
//

import UIKit

class YFHomeViewController: YFBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: 设置UI界面
extension YFHomeViewController {
    fileprivate func setupUI() {
        //1.设置导航栏
        setupNavigationBar()
    }
    fileprivate func setupNavigationBar() {
        //1.设置左侧item
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        //2.设置右侧item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highlightImage: "image_my_history_clicked", size: size)

        let searchItem = UIBarButtonItem(imageName: "btn_search", highlightImage: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highlightImage: "Image_scan_clicked", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}














