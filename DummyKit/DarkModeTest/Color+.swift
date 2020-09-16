////  Color+.swift
//  DummyKit
//
//  Created by hexch on 2020/09/14.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let whiteBlack = UIColor(.dm) { traitCollection in
        return traitCollection.userInterfaceStyle == .dark ? UIColor.black : UIColor.white
    }
    static let blackWhite = UIColor(.dm, light: UIColor.black , dark: UIColor.white)
    static let gold =  UIColor(.dm, light: UIColor.init(red: 255/255.0, green: 198/255.0, blue: 98/255.0, alpha: 1), dark:  UIColor.init(red: 255/255.0, green: 198/255.0, blue: 98/255.0, alpha: 1))
}
