//
//  PageContentView.swift
//  DYTV-swift
//
//  Created by YangFan on 2017/1/19.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

fileprivate let ContentCellID = "ContentCellID"

class PageContentView: UIView {

    //MARK: 定义属性
    fileprivate var childVcs: [UIViewController]
    fileprivate var parentViewController: UIViewController
    //MARK: 懒加载属性
    fileprivate lazy var colletionView: UICollectionView = {
        //1.创建layout
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        //2.创建CollectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.bounces = false
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        return collectionView
    }()
    //MARK: 自定义构造函数
     init(frame: CGRect, childVcs: [UIViewController], parentViewController: UIViewController) {
        self.childVcs = childVcs
        self.parentViewController = parentViewController
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: 设置UI界面
extension PageContentView {
    fileprivate func setupUI() {
        //1.将所有自控制器添加到父控制器上
        for childVc in childVcs {
            parentViewController.addChildViewController(childVc)
        }
        //2.添加UICollectionView，用于在cell存放控制器的view
        addSubview(colletionView)
        colletionView.frame = bounds
    }
}

//MARK: dataSource
extension PageContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVcs.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1.创建cell
        let cell = colletionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        //2.给cell设置内容
    
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        let childVc = childVcs[indexPath.item]
        childVc.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVc.view)
        return cell
    }
}
