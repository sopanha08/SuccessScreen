//
//  ScanNationIdViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 31/3/21.
//

import UIKit
import AVFoundation

class ScanNationIdViewController: BaseViewController  {
    @IBOutlet weak var mrzScannerView: QKMRZScannerView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var manualInputLabel: UILabel!
    
    @IBOutlet weak var takePhotoButton: CameraButton!
    @IBOutlet weak var takePhotoCornorImageView: UIImageView!

    var timer = Timer()
    var totalSecond = 30
    
    // MARK: - View Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        scheduledTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mrzScannerView.isTakePhotoClicked = false
        mrzScannerView.startScanning()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mrzScannerView.stopScanning()
    }
    
    // MARK: - Private
    private func scheduledTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func invalidate() {
        timer.invalidate()
    }
    
    private func setupView() {
        takePhotoCornorImageView.isHidden = true
        takePhotoButton.isHidden = true
        addBackButton()
        mrzScannerView.delegate = self
        
        titleLabel.text = "scan_national_id_card_title".localizedString
        descriptionLabel.text = "scan_national_id_card_description".localizedString
    }
    
    // MARK: - QKMRZScannerViewDelegate
    @IBAction func takPhotoDidTap() {
        mrzScannerView.isTakePhotoClicked = true
    }
    
    @objc func updateTime() {
        if totalSecond != 0 {
            totalSecond -= 1
        } else {
            takePhotoCornorImageView.isHidden = false
            takePhotoButton.isHidden = false
            invalidate()
        }
        
        let fullAttributedString = NSMutableAttributedString()
        
        let attributedLinkString = NSMutableAttributedString(string: "scan_national_id_card_manual_input".localizedString,
                                                             attributes: [
                                                                .font: UIFont(name: "HelveticaNeue", size: 14.0)!,
                                                                .foregroundColor: UIColor.white
                                                             ])
        
        let fullString = String(format: "scan_national_id_card_manual_input_second".localizedString, totalSecond)
        let attributedLinkString1 = NSMutableAttributedString(string: fullString,
                                                              attributes:[.font: UIFont(name: "HelveticaNeue-Bold", size: 14.0)!,
                                                                          .foregroundColor: UIColor.white])
        fullAttributedString.append(attributedLinkString)
        fullAttributedString.append(attributedLinkString1)
        
        
        manualInputLabel.attributedText = fullAttributedString
    }
}

// MARK: - QKMRZScannerViewDelegate
extension ScanNationIdViewController: QKMRZScannerViewDelegate {
    func mrzScannerView(_ mrzScannerView: QKMRZScannerView, didFind scanResult: QKMRZScanResult) {
        let vc = PersonalInformationViewController()
        vc.viewModel = PersonalInformationViewModel(with: scanResult)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func mrzScannerView(_ mrzScannerView: QKMRZScannerView, didFind image: UIImage) {
        let vc = PersonalInformationViewController()
        vc.viewModel = PersonalInformationViewModel()
        navigationController?.pushViewController(vc, animated: true)
        /*
        let preview = CameraPreviewViewController()
        preview.capturedImage = image
        navigationController?.pushViewController(preview, animated: true)
        */
    }
}
