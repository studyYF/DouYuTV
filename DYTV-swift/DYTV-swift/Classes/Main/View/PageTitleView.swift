//
//  PageTitleView.swift
//  DYTV-swift
//
//  Created by YangFan on 2017/1/18.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

private let kScrollLineH: CGFloat = 2
class PageTitleView: UIView {

    //MARK: 定义属性
    fileprivate var titles: [String]
    
    //MARK: 懒加载属性
    fileprivate lazy var titleLabels = [UILabel]()
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine: UIView = {
       let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    
    
    //MARK: 自定义构造函数
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }  

}



//MARK: 设置UI
extension PageTitleView {
    fileprivate func setUI() {
        //1.添加scrollView
        addSubview(scrollView)
        scrollView.frame = self.bounds
        //2.添加title对应的label
        setupTitleLabels()
        //3.设置底线和滚动滑条
        setupBottomMenuAndScrollLine()
    }
    private func setupTitleLabels() {
        let labelW: CGFloat = frame.width / CGFloat(titles.count)
        let labelH: CGFloat = frame.height - kScrollLineH
        let labelY: CGFloat = 0
        for (index, title) in titles.enumerated() {
            //1.创建uilabel
            let label = UILabel()
            //2.设置label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            //3.label的frame
            let labelX: CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            addSubview(label)
            titleLabels.append(label)
        }
    }
    private func setupBottomMenuAndScrollLine() {
        //1.底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        //2.滑动条
        //2.1获得第一个label
        guard let firstLabel = titleLabels.first else {
            return
        }
        firstLabel.textColor = UIColor.orange
        //2.设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}
