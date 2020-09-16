////  LanguageUtils.swift
//  DummyKit
//
//  Created by hexch on 2020/09/14.
//  github:https://github.com/hexch
//
//  Copyright © 2020 hexch. All rights reserved.
//

import Foundation
import UIKit

fileprivate extension String{
    static var kLanguageKey :String { return "kLanguageKey" }
}
private enum SuppportedLanguage:String{
    case english="en"
    case japanese="ja-JP"
    case chinese="zh-Hans"
}
class LanguageSetting{
    
    private var language:SuppportedLanguage = .english
    
    static let shared: LanguageSetting = {
        let appSettings: LanguageSetting = .init()
        if let savedData = UserDefaults.standard.string(forKey: .kLanguageKey){
            appSettings.language = SuppportedLanguage.init(rawValue: savedData) ?? .english
        }
        return appSettings
    }()
    
    func chooseLanguage(vc:ViewController) {
        DispatchQueue.main.async {
            let sheet = UIAlertController.init(title: .localized_ChoseLanguage, message: nil, preferredStyle: .actionSheet)
            sheet.addAction(UIAlertAction.init(title: .localized_English, style: .default, handler: { (action) in
                self.change(lan: .english,vc:vc)
            }))
            sheet.addAction(UIAlertAction.init(title: .localized_Japanese, style: .default, handler: { (action) in
                self.change(lan: .japanese,vc:vc)
            }))
            sheet.addAction(UIAlertAction.init(title: .localized_Cancel, style: .cancel, handler: nil))
        
            vc.present(sheet, animated: true, completion: nil)
        }
    }
    private func change(lan:SuppportedLanguage,vc:ViewController){
        if self.language == lan{
            return
        }
        self.language = lan
        UserDefaults.standard.set(lan.rawValue, forKey: .kLanguageKey)
        
        UIApplication.shared.windows.forEach{$0.alpha = 0}
        vc.view.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            UIView.animate(withDuration: 1, animations: {vc.view.isHidden = false;UIApplication.shared.windows.forEach{$0.alpha = 1}})
        })
    }
}
class BundleEx: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = Bundle.getLanguageBundel() {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        }else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}
extension Bundle {
    private static var onLanguageDispatchOnce: ()->Void = {
        //替换Bundle.main为自定义的BundleEx
        object_setClass(Bundle.main, BundleEx.self)
    }
    func onLanguage(){
        Bundle.onLanguageDispatchOnce()
    }
    class func getLanguageBundel() -> Bundle? {
        let languageBundlePath = Bundle.main.path(forResource: UserDefaults.standard.string(forKey: .kLanguageKey)
            , ofType: "lproj")
        //        print("path = \(languageBundlePath)")
        guard languageBundlePath != nil else {
            return nil
        }
        let languageBundle = Bundle.init(path: languageBundlePath!)
        guard languageBundle != nil else {
            return nil
        }
        return languageBundle!
    }
}

extension String {
func localized(_ lang:String) ->String {

    let path = Bundle.main.path(forResource: lang, ofType: "lproj")
    let bundle = Bundle(path: path!)

    return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
}}
