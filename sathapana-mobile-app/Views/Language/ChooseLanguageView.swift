//
//  ChooseLanguageView.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 26/3/21.
//

import UIKit

enum Language: Int, CaseIterable  {
    case Khmer
    case English
    case Korean
    case China
    case Japan
    
    var countryName: String {
        switch self {
        case .Khmer:
            return "ភាសាខ្មែរ"
        case .English:
            return "English"
        case .Korean:
            return "한국어"
        case .China:
            return "中文"
        case .Japan:
            return "日本語"
        }
    }
    
    var imageName: String {
        switch self {
        case .Khmer:
            return "cambodia_flag"
        case .English:
            return "unitedKingdom_flag"
        case .Korean:
            return "southKorea_flag"
        case .China:
            return "china_flag"
        case .Japan:
            return "japan_flag"
        }
    }
    
    var localizedFileName: String {
        switch self {
        case .Khmer:
            return "km"
        case .English:
            return "en"
        case .Korean:
            return "ko"
        case .China:
            return "zh-Hans"
        case .Japan:
            return "jp"
        }
    }
}

protocol ChooseLanguageViewDelegate: NSObjectProtocol {
    func didClickLanguage(with language: Language)
}

class ChooseLanguageView: UIView, NibLoadableView {
    @IBOutlet weak var chooseCityLabel: UILabel!
    
    @IBOutlet weak var topStackview: UIStackView!
    @IBOutlet weak var bottomStackView: UIStackView!
    
    weak var delegate: ChooseLanguageViewDelegate?
    
    // MARK: - View Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        chooseCityLabel.text = "choose_your_language".localizedString.uppercased()
        setupStackView()
    }
    
    private func setupStackView() {
        for (index, flag) in [Language.Khmer, Language.English, Language.Korean].enumerated() {
            let view = FlagView()
            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapChangeLanguage(with:)))
            view.addGestureRecognizer(tap)
            view.tag = index
            
            view.titleLabel.text = flag.countryName
            view.imageView.image = UIImage(named: flag.imageName)
            topStackview.addArrangedSubview(view)
        }
        
        let lasIndex = 2
        for (index, flag) in [Language.China, Language.Japan, Language.Korean].enumerated() {
            let view = FlagView()
            let tap = UITapGestureRecognizer(target: self, action: #selector(didTapChangeLanguage(with:)))
            view.addGestureRecognizer(tap)
            view.tag = index + 3
            view.alpha = index == lasIndex ? 0 : 1
            view.titleLabel.text = flag.countryName
            view.imageView.image = UIImage(named: flag.imageName)
            bottomStackView.addArrangedSubview(view)
        }
    }
    
    // MARK: - Actions
    @objc func didTapChangeLanguage(with gesture: UITapGestureRecognizer) {
        guard let view = gesture.view,
              let flag = Language(rawValue: view.tag) else { return }
        
        delegate?.didClickLanguage(with: flag)
    }
}
