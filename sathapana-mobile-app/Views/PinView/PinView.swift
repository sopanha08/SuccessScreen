//
//  PinView.swift
//  sathapana-mobile-app
//
//  Created by Sreng125 on 3/24/21.
//

import UIKit

protocol PinDelegate: class {
    func summitPinCode(pinCode: String)
    func scanBiometric()
}

class PinView: UIView, NibLoadableView {
    
    @IBOutlet weak var pinTextField: UITextField!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var forthView: UIView!
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var sixthView: UIView!
    @IBOutlet weak var containerView: UIStackView!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var forthLabel: UILabel!
    @IBOutlet weak var fifthLabel: UILabel!
    @IBOutlet weak var sixthLabel: UILabel!
    
    var isHideCode: Bool = false
    var isCustomKeyboard: Bool = false
    var isPresent: Bool = false
    
    lazy var biometricUtils: BiometricUtils = { [unowned self] in
        let vc = BiometricUtils()
        return vc
    }()
    
    weak var delegate: PinDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    override func awakeFromNib() {
        setUI()
    }
}

// MARK:  Functions
extension PinView {
    
    private func setUI() {
        
        
        pinTextField.isHidden = true
        
        if isCustomKeyboard {
            if isPresent {
                
            } else {
                let keyboardView = NumbericPad(frame: CGRect(x: 0, y: 0, width: 0, height: 350))
                keyboardView.isScan = true
                keyboardView.delegate = self
                pinTextField.keyboardAppearance = .light
                pinTextField.inputView = keyboardView
            }
        } else {
            pinTextField.delegate = self
            pinTextField.keyboardType = .numberPad
        }
        
        if isPresent {
            firstView.setBoarderWhite()
            secondView.setBoarderWhite()
            thirdView.setBoarderWhite()
            forthView.setBoarderWhite()
            fifthView.setBoarderWhite()
            sixthView.setBoarderWhite()
            
            firstLabel.textColor = .white
            secondLabel.textColor = .white
            thirdLabel.textColor = .white
            forthLabel.textColor = .white
            fifthLabel.textColor = .white
            sixthLabel.textColor = .white
            
        } else {
            firstView.setBoarder()
            secondView.setBoarder()
            thirdView.setBoarder()
            forthView.setBoarder()
            fifthView.setBoarder()
            sixthView.setBoarder()
        }
        
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(setPinTFAction))
        containerView.addGestureRecognizer(tabGesture)
        
        
        
        firstLabel.isHidden = true
        secondLabel.isHidden = true
        thirdLabel.isHidden = true
        forthLabel.isHidden = true
        fifthLabel.isHidden = true
        sixthLabel.isHidden = true
        
    }
    
    func clear() {
        pinTextField.text = ""
        firstView.isHidden = true
        secondView.isHidden = true
        thirdView.isHidden = true
        forthView.isHidden = true
        fifthView.isHidden = true
        sixthView.isHidden = true
    }
}

// MARK:  Functions
extension PinView {
    
    func setCurrentOTP(index: Int, isHidden: Bool) {
        print(index)
        switch index {
        case 1:
            firstLabel.isHidden = !isHidden
        case 2:
            secondLabel.isHidden = !isHidden
        case 3:
            thirdLabel.isHidden = !isHidden
        case 4:
            forthLabel.isHidden = !isHidden
        case 5:
            fifthLabel.isHidden = !isHidden
        case 6:
            sixthLabel.isHidden = !isHidden
            fifthLabel.isHidden = !isHidden
            forthLabel.isHidden = !isHidden
            thirdLabel.isHidden = !isHidden
            secondLabel.isHidden = !isHidden
            firstLabel.isHidden = !isHidden
            if !isHidden {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    // self.pushNotificationNotify()
                }
            }
        default:
            break
        }
    }
    
    private func deleteCurrentOTP(index: Int, isHidden: Bool) {
        print(index)
        switch index {
        case 1:
            firstLabel.isHidden = !isHidden
        case 2:
            secondLabel.isHidden = !isHidden
        case 3:
            thirdLabel.isHidden = !isHidden
        case 4:
            forthLabel.isHidden = !isHidden
        case 5:
            fifthLabel.isHidden = !isHidden
        case 6:
            sixthLabel.isHidden = !isHidden
            if !isHidden {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    // self.pushNotificationNotify()
                }
            }
        default:
            break
        }
    }
    
    
    @objc func setPinTFAction() {
        pinTextField.becomeFirstResponder()
    }
    
    func setPinTextField(character: String) {
        if pinTextField.text?.count == 6 {
            firstLabel.text = String((pinTextField.text?.character(at: 0))!)
            secondLabel.text = String((pinTextField.text?.character(at: 1))!)
            thirdLabel.text = String((pinTextField.text?.character(at: 2))!)
            forthLabel.text = String((pinTextField.text?.character(at: 3))!)
            fifthLabel.text = String((pinTextField.text?.character(at: 4))!)
            sixthLabel.text = String((pinTextField.text?.character(at: 5))!)
            self.delegate?.summitPinCode(pinCode: pinTextField.text ?? "")
        }
        setCurrentOTP(index: pinTextField.text?.count ?? -1 , isHidden: true)
        
    }
}

// MARK:  Keyboard Delegate
extension PinView: KeyboardDelegate {
    func scanTapped() {
        self.delegate?.scanBiometric()
    }
    
    func numPadTapped(character: String) {
        if pinTextField.text?.count ?? 0 <= 5 {
            pinTextField.text = (pinTextField.text ?? "") + character
            if isHideCode == true {
                switch pinTextField.text?.count {
                case 1:
                    firstLabel.text = "●"
                case 2:
                    secondLabel.text = "●"
                case 3:
                    thirdLabel.text = "●"
                case 4:
                    forthLabel.text = "●"
                case 5:
                    fifthLabel.text = "●"
                case 6:
                    sixthLabel.text = "●"
                    self.delegate?.summitPinCode(pinCode: pinTextField.text ?? "")
                default:
                    break
                }
            } else {
                switch pinTextField.text?.count {
                case 1:
                    firstLabel.text = character
                case 2:
                    secondLabel.text = character
                case 3:
                    thirdLabel.text = character
                case 4:
                    forthLabel.text = character
                case 5:
                    fifthLabel.text = character
                case 6:
                    sixthLabel.text = character
                    self.delegate?.summitPinCode(pinCode: pinTextField.text ?? "")
                default:
                    break
                }
            }
            setCurrentOTP(index: pinTextField.text?.count ?? -1 , isHidden: true)
        }
        
    }
    
    func deletePadTapped() {
        guard var pin = pinTextField.text else { return }
        KeyboardHelper.shared.removeLastIndexString(string: &pin)
        pinTextField.text = pin
        deleteCurrentOTP(index: (pinTextField.text?.count ?? 0) + 1, isHidden: false)
    }
    
    // For present pin view
    func numberTap(character: String) {
        if pinTextField.text?.count ?? 0 <= 5 {
            pinTextField.text = (pinTextField.text ?? "") + character
            if isHideCode == true {
                switch pinTextField.text?.count {
                case 1:
                    firstLabel.text = "●"
                case 2:
                    secondLabel.text = "●"
                case 3:
                    thirdLabel.text = "●"
                case 4:
                    forthLabel.text = "●"
                case 5:
                    fifthLabel.text = "●"
                case 6:
                    sixthLabel.text = "●"
                    self.delegate?.summitPinCode(pinCode: pinTextField.text ?? "")
                default:
                    break
                }
            } else {
                switch pinTextField.text?.count {
                case 1:
                    firstLabel.text = character
                case 2:
                    secondLabel.text = character
                case 3:
                    thirdLabel.text = character
                case 4:
                    forthLabel.text = character
                case 5:
                    fifthLabel.text = character
                case 6:
                    sixthLabel.text = character
                    self.delegate?.summitPinCode(pinCode: pinTextField.text ?? "")
                default:
                    break
                }
            }
            setCurrentOTP(index: pinTextField.text?.count ?? -1 , isHidden: true)
        }
    }
    
    func numberDelete() {
        guard var pin = pinTextField.text else { return }
        KeyboardHelper.shared.removeLastIndexString(string: &pin)
        pinTextField.text = pin
        deleteCurrentOTP(index: (pinTextField.text?.count ?? 0) + 1, isHidden: false)
    }
}


// MARK:  Normal Keyboard Delegate
extension PinView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("==>>\(textField.text)")
        if textField.text?.count ?? 0 <= 6 {
            textField.text = (textField.text ?? "")
            if isHideCode == true {
                switch pinTextField.text?.count ?? 0 {
                case 1:
                    firstLabel.text = "•"
                    secondLabel.text = ""
                    thirdLabel.text = ""
                    forthLabel.text = ""
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                case 2:
                    secondLabel.text = "•"
                    thirdLabel.text = ""
                    forthLabel.text = ""
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                case 3:
                    thirdLabel.text = "•"
                    forthLabel.text = ""
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                case 4:
                    forthLabel.text = "•"
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                case 5:
                    fifthLabel.text = "•"
                    sixthLabel.text = ""
                case 6:
                    sixthLabel.text = "•"
                    self.delegate?.summitPinCode(pinCode: pinTextField.text ?? "")
                default:
                    firstLabel.text = ""
                    secondLabel.text = ""
                    thirdLabel.text = ""
                    forthLabel.text = ""
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                    break
                }
            } else {
                switch pinTextField.text?.count ?? 0 {
                case 1:
                    firstLabel.text = String((pinTextField.text?.last)!)
                    secondLabel.text = ""
                    thirdLabel.text = ""
                    forthLabel.text = ""
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                case 2:
                    secondLabel.text = String((pinTextField.text?.last)!)
                    thirdLabel.text = ""
                    forthLabel.text = ""
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                case 3:
                    thirdLabel.text = String((pinTextField.text?.last)!)
                    forthLabel.text = ""
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                case 4:
                    forthLabel.text = String((pinTextField.text?.last)!)
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                case 5:
                    fifthLabel.text = String((pinTextField.text?.last)!)
                    sixthLabel.text = ""
                case 6:
                    firstLabel.text = String((pinTextField.text?.character(at: 0))!)
                    secondLabel.text = String((pinTextField.text?.character(at: 1))!)
                    thirdLabel.text = String((pinTextField.text?.character(at: 2))!)
                    forthLabel.text = String((pinTextField.text?.character(at: 3))!)
                    fifthLabel.text = String((pinTextField.text?.character(at: 4))!)
                    sixthLabel.text = String((pinTextField.text?.character(at: 5))!)
                    self.delegate?.summitPinCode(pinCode: pinTextField.text ?? "")
                default:
                    firstLabel.text = ""
                    secondLabel.text = ""
                    thirdLabel.text = ""
                    forthLabel.text = ""
                    fifthLabel.text = ""
                    sixthLabel.text = ""
                    break
                }
            }
            setCurrentOTP(index: pinTextField.text?.count ?? -1 , isHidden: true)
        }
    }
}
