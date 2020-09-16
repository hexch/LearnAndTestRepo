////  FenceButtonGroup.swift
//  DummyKit
//
//  Created by hexch on 2020/09/15.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class FenceButtonGroup: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }

    let b1 = UIButton.init(frame: .zero)
    let b2 = UIButton.init(frame: .zero)
    let s1 = UIView(frame: .zero)
    override func layoutSubviews() {
        self.subviews.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        _ = b1.anchor(self.leftAnchor, right: nil, top: self.topAnchor, bottom: self.bottomAnchor,width:40)
        _ = s1.anchor(b1.rightAnchor, right: nil, top: self.topAnchor,topPadding: 2, bottom: self.bottomAnchor,bottomPadding: 2,width:0.5)
        _ = b2.anchor(s1.rightAnchor, right: self.rightAnchor, top: self.topAnchor,topPadding: 2, bottom: self.bottomAnchor,bottomPadding: 2)
    }
    private func setupView(){
        self.addSubview(b1)
        self.addSubview(b2)
        self.addSubview(s1)
        s1.backgroundColor = UIColor(.dm, light: UIColor.init(red: 62/255.0, green: 62/255.0, blue: 62/255.0, alpha: 1), dark: UIColor.white)
        b1.setImage(UIImage(systemName: "sun.max"), for: .normal)
        b2.setTitle("T", for: .normal)
        b2.setTitleColor(.gold, for: .normal)
        self.borderColor = .clear
        self.borderWidth = 1
        self.cornerRadius = 5
        self.backgroundColor = .whiteBlack
    }
}
