////  ViewController.swift
//  DummyKit
//
//  Created by hexch on 2020/09/14.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import UIKit
import FluentDarkModeKit

class ViewController: UIViewController {

    @IBOutlet weak var switchButton :UISwitch!
    @IBOutlet weak var modeLabel :UILabel!
    @IBOutlet weak var tf:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .whiteBlack
        if DMTraitCollection.override.userInterfaceStyle == .dark{
            switchButton.isOn = true
        }else{
            switchButton.isOn = false
        }
        modeLabel.textColor = .blackWhite
        updateLabel()
        tf.attachView()
    }

    override func viewWillAppear(_ animated: Bool) {
        updateLabel()
    }
    @IBAction func onLanChanging(_ sender: Any) {
        LanguageSetting.shared.chooseLanguage(vc: self)
    }
    @IBAction func onThemeChanged(_ sender: Any) {
        if let sw  = sender as? UISwitch{
            if sw.isOn{
            DMTraitCollection.setOverride(DMTraitCollection(userInterfaceStyle: .dark), animated: true) // Change to light theme with animation
            }else{
                DMTraitCollection.setOverride(DMTraitCollection(userInterfaceStyle: .light), animated: true) // Change to light theme with animation
            }
            updateLabel()
        }
    }
    
    private func updateLabel(){
        print(String.localized_lightmode)
        if switchButton.isOn {
            modeLabel.text = .localized_darmode
        }else{
            modeLabel.text = .localized_lightmode
        }
    }
}

