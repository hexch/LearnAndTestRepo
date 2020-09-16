////  AttachedView.swift
//  DummyKit
//
//  Created by hexch on 2020/09/14.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import UIKit

fileprivate extension Selector{
    static let onDismissClicked = #selector(AttachedView.onDismissClicked)
}
@IBDesignable
class AttachedView: UIView {
    private static let viewHeight:CGFloat = 40
    
    var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        return view
    }()
    var seperator :UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(.dm, light: UIColor.init(red: 62/255.0, green: 62/255.0, blue: 62/255.0, alpha: 1), dark: UIColor.white)
        return view
    }()
    var dismissItem :UIButton = {
        let item = UIButton(frame:.zero)
        item.setImage(UIImage(systemName: "keyboard.chevron.compact.down"), for: .normal)
        item.tintColor = .blackWhite
        item.addTarget(self, action: .onDismissClicked, for: .touchUpInside)
        return item
    }()
    
    let onDismiss :Delegate<Void,Void> = Delegate<Void,Void>()
    
    convenience init(){
        self.init(frame:.init(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: AttachedView.viewHeight)))
    }
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
    override func layoutSubviews() {
        self.subviews.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        _ = self.dismissItem.anchor(nil, centerY: self.centerYAnchor)
        _ = self.dismissItem.anchor(nil, right: self.rightAnchor, top: nil, bottom: nil,width:43,height: self.bounds.height)
        _ = self.seperator.anchor(nil, right: self.dismissItem.leftAnchor, rightPadding:1, top: self.topAnchor, topPadding:2, bottom: self.bottomAnchor,bottomPadding:2,width: 0.5)
        _ = self.scrollView.anchor(self.leftAnchor, right: self.seperator.leftAnchor,  top: self.topAnchor, topPadding:3, bottom: self.bottomAnchor,bottomPadding:3)
    }
    private func setupView(){
        self.addSubview(self.dismissItem)
        self.addSubview(self.seperator)
        self.addSubview(self.scrollView)
        self.backgroundColor = UIColor(.dm, light: UIColor.init(red: 216/255.0, green: 217/255.0, blue: 221/255.0, alpha: 1), dark: UIColor.init(red: 44/255.0, green: 44/255.0, blue: 44/255.0, alpha: 1))
        
        self.setupScrollView()
    }
    
    private func setupScrollView(){
        self.scrollView.showsHorizontalScrollIndicator = false
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 3.0
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(stackView)
        
        let btns = [UIButton.attachedButton(image: nil, label: "test"),
                    UIButton.attachedButton(image: UIImage.init(systemName: "folder"), label: "test folder"),
                    FenceButtonGroup(frame: .init(origin: .zero, size: .init(width: 80, height: AttachedView.viewHeight - 6))),
                    FenceButtonGroup(frame: .init(origin: .zero, size: .init(width: 80, height: AttachedView.viewHeight - 6))),
                    FenceButtonGroup(frame: .init(origin: .zero, size: .init(width: 80, height: AttachedView.viewHeight - 6))),
                    FenceButtonGroup(frame: .init(origin: .zero, size: .init(width: 80, height: AttachedView.viewHeight - 6))),
                    FenceButtonGroup(frame: .init(origin: .zero, size: .init(width: 80, height: AttachedView.viewHeight - 6))),
                    FenceButtonGroup(frame: .init(origin: .zero, size: .init(width: 80, height: AttachedView.viewHeight - 6))),
                    FenceButtonGroup(frame: .init(origin: .zero, size: .init(width: 80, height: AttachedView.viewHeight - 6)))]
        btns.forEach{stackView.addArrangedSubview($0)}
        self.scrollView.contenAnchor(stackView.leftAnchor,leftPadding: -3.0, right: stackView.rightAnchor, top: nil, bottom: nil)
        _ = stackView.anchor(nil, right: nil, top: self.scrollView.frameLayoutGuide.topAnchor, bottom: self.scrollView.frameLayoutGuide.bottomAnchor)
    }
    @objc func onDismissClicked(){
        self.onDismiss.call()
    }
}
