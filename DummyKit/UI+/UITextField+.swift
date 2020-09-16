////  UITextField+.swift
//  DummyKit
//
//  Created by hexch on 2020/09/14.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
   
    func numberKeyboard()->UITextField{
        self.keyboardType = .numberPad
        return self
    }
    func attachView(){
        let av = AttachedView()
        av.onDismiss.delegate(on: self, block: {(weakSelf,_) in
            weakSelf.doneClicked()
        })
        self.inputAccessoryView = av
    }
    func test(){
        let lb = UILabel(frame: .init(origin: .zero, size: .init(width:  UIScreen.main.bounds.width , height: 30)))
        lb.text = "abc"
        lb.textColor = UIColor.red
        lb.backgroundColor = UIColor(.dm, light: UIColor.init(red: 216/255.0, green: 217/255.0, blue: 221/255.0, alpha: 1), dark: UIColor.init(red: 44/255.0, green: 44/255.0, blue: 44/255.0, alpha: 1))
        self.inputAccessoryView = lb
    }
    func doneToolbar(width:CGFloat = UIScreen.main.bounds.width,height:CGFloat = 30.0){
        let toolbar = UIToolbar(frame: .init(origin: .zero, size: .init(width: width , height: height)))
        toolbar.backgroundColor = UIColor.gray
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let keyDown = UIBarButtonItem(image: UIImage.init(systemName: "keyboard.chevron.compact.down"), style: .done, target: self, action: #selector(doneClicked))
        let keyDownBtn = UIButton(frame: .init(x: 0, y: 0, width: 24, height: 24))
        keyDownBtn.setImage(UIImage.init(systemName: "keyboard.chevron.compact.down"), for: .normal)
//        keyDownBtn.
//        let doneButton = UIBarButtonItem(title: "更新", style: .done, target: self, action: #selector(doneClicked))
        let btg = UIBarButtonItemGroup(barButtonItems: [keyDown,keyDown,keyDown,keyDown,keyDown,keyDown,keyDown,keyDown,keyDown], representativeItem: .none)
        toolbar.setItems([flexSpace,keyDown], animated: false)
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    @objc func doneClicked(){
        self.endEditing(true)
    }
}
