//
//  String+Localizable.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 24/3/21.
//

import UIKit
import Foundation

class Storage {
    let selectedLanguage = "languageKey"
    // MARK: - Private properties
    private var defaults: UserDefaults {
        UserDefaults.standard
    }
    
    func setLanguage(with language: Language) {
        defaults.set(language.localizedFileName, forKey: selectedLanguage)
        defaults.synchronize()
    }
    
    func getLanguange() -> String {
        guard let language = defaults.object(forKey: selectedLanguage) as? String else {
            return Language.English.localizedFileName
        }
        return language
    }
}

extension String {
    var localizedString: String {
        let storage = Storage()
        return localized(code: storage.getLanguange())
    }
    
    private func localized(code: String = Language.English.localizedFileName) -> String {
        
        guard let bundlePath = Bundle.main.path(forResource: code,
                                                ofType: "lproj") else { return self }
        let languageBundle = Bundle(path: bundlePath)
        
        guard let translatedText = languageBundle?.localizedString(forKey: self,
                                                                   value: "", table: nil) else { return "" }
        
        return translatedText
    }
    
    func index(at position: Int, from start: Index? = nil) -> Index? {
            let startingIndex = start ?? startIndex
            return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
     
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
}
