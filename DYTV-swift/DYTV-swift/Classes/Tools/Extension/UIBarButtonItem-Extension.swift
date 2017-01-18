//
//  UIBarButtonItem-Extension.swift
//  DYTV
//
//  Created by YangFan on 2017/1/12.
//  Copyright © 2017年 YangFan. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    /*
    class func createItem(imageName: String, highlightImage: String, size: CGSize) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: highlightImage), for: .highlighted)
        button.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        return UIBarButtonItem(customView: button)
    }
 */
    //swift中使用构造函数更好
    convenience init(imageName: String, highlightImage: String = "", size: CGSize = CGSize.zero) {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        if highlightImage != "" {
            button.setImage(UIImage(named: highlightImage), for: .highlighted)
        }
        if size != CGSize.zero {
            button.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        } else {
            button.sizeToFit()
        }
        self.init(customView: button)
    }
}
