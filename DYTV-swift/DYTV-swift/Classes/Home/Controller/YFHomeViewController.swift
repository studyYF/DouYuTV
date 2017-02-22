//
//  YFHomeViewController.swift
//  DouYuTV-swift
//
//  Created by YangFan on 2016/12/28.
//  Copyright © 2016年 YangFan. All rights reserved.
//

import UIKit

private let kTitleViewH: CGFloat = 40

class YFHomeViewController: YFBaseViewController {
    
    //MARK: 懒加载属性
    fileprivate lazy var pageTitleView: PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        return titleView
    }()
    fileprivate lazy var pageContentView: PageContentView = {
        let contentHeight = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenH, height: contentHeight)
        let childVcs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
        }
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        return contentView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: 设置UI界面
extension YFHomeViewController {
    fileprivate func setupUI() {
        //0.不需要调整scrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        //1.设置导航栏
        setupNavigationBar()
        //2.添加titleView
        view.addSubview(pageTitleView)
        //3.添加contentView
        view.addSubview(pageContentView)
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














