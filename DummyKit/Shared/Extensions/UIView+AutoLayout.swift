////  UIView+AutoLayout.swift
//  HabitApp
//
//  Created by hexch on 2020/08/12.
//  github:https://github.com/hexch
//
//  Copyright © 2020 homeneco01. All rights reserved.
//

import Foundation
import UIKit

extension UIScrollView{
    func frameAnchor(_ left:NSLayoutXAxisAnchor?, leftPadding:CGFloat = 0,
                     right:NSLayoutXAxisAnchor?, rightPadding:CGFloat = 0,
                     top:NSLayoutYAxisAnchor?, topPadding:CGFloat = 0,
                     bottom:NSLayoutYAxisAnchor?, bottomPadding:CGFloat = 0,
                     width:CGFloat? = nil,height:CGFloat? = nil){
        if let left = left {
            self.frameLayoutGuide.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        
        if let right = right {
            self.frameLayoutGuide.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        
        if let top = top {
            self.frameLayoutGuide.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let bottom = bottom {
            self.frameLayoutGuide.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        
        if let width = width {
            self.frameLayoutGuide.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            self.frameLayoutGuide.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func contenAnchor(_ left:NSLayoutXAxisAnchor?, leftPadding:CGFloat = 0,
                      right:NSLayoutXAxisAnchor?, rightPadding:CGFloat = 0,
                      top:NSLayoutYAxisAnchor?, topPadding:CGFloat = 0,
                      bottom:NSLayoutYAxisAnchor?, bottomPadding:CGFloat = 0,
                      width:CGFloat? = nil,height:CGFloat? = nil){
        if let left = left {
            self.contentLayoutGuide.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        
        if let right = right {
            self.contentLayoutGuide.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        
        if let top = top {
            self.contentLayoutGuide.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let bottom = bottom {
            self.contentLayoutGuide.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        
        if let width = width {
            self.contentLayoutGuide.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            self.contentLayoutGuide.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
extension UIView {
    
    func anchor(wrap view:UIView){
        self.anchor(view.leftAnchor, right: view.rightAnchor, top: view.topAnchor, bottom: view.bottomAnchor).setNeedsLayout()
    }
    func anchor(_ left:NSLayoutXAxisAnchor?, leftPadding:CGFloat = 0,
                right:NSLayoutXAxisAnchor?, rightPadding:CGFloat = 0,
                top:NSLayoutYAxisAnchor?, topPadding:CGFloat = 0,
                bottom:NSLayoutYAxisAnchor?, bottomPadding:CGFloat = 0,
                width:CGFloat? = nil,height:CGFloat? = nil) -> UIView{
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: leftPadding).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -rightPadding).isActive = true
        }
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -bottomPadding).isActive = true
        }
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return self
    }
    
    func anchor(_ width:NSLayoutDimension?, wmultiplier:CGFloat?, wconstant:CGFloat = 0,
                height:NSLayoutDimension?, hmultiplier:CGFloat?,hconstant:CGFloat = 0) -> UIView{
        if let width = width, let wmultiplier = wmultiplier {
            self.widthAnchor.constraint(equalTo: width, multiplier: wmultiplier, constant: wconstant).isActive = true
        }
        
        if let height = height,let hmultiplier = hmultiplier {
            self.heightAnchor.constraint(equalTo: height, multiplier: hmultiplier, constant: hconstant).isActive = true
        }
        return self
    }
    
    func anchor(_ centerX:NSLayoutXAxisAnchor?, constantX:CGFloat = 0,
                centerY:NSLayoutYAxisAnchor?, constantY:CGFloat = 0) -> UIView{
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX, constant: constantX).isActive = true
        }
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY, constant: constantY).isActive = true
        }
        return self
    }
}
