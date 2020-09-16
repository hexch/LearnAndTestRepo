////  AttachedButton.swift
//  DummyKit
//
//  Created by hexch on 2020/09/15.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    static func attachedButton(image:UIImage?, label:String?)->UIButton{
        let button = UIButton(frame: .init(origin: .zero, size: .init(width: 0, height: 34)))
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = .gold
        button.setTitle(label, for: .normal)
        button.setTitleColor(.gold, for: .normal)
        button.setTitleColor(.blackWhite, for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize:  12.0)
        button.contentEdgeInsets = .init(top: 0, left: 5, bottom: 0, right: 5)
        button.borderColor = .blackWhite
        button.borderWidth = 0.5
        button.cornerRadius = 3
        
//        button.backgroundColor = UIColor(.dm, light: .white, dark:  UIColor.init(red: 100/255.0, green: 97/255.0, blue: 104/255.0, alpha: 1))
        button.backgroundColor = .whiteBlack
        button.sizeToFit()
        return button
    }
}
