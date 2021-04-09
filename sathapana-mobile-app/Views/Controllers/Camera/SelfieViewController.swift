//
//  SelfieViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 30/3/21.
//

import UIKit
import AVFoundation

enum CameraState: Int {
    case front = 0
    case rear
}

class SelfieViewController: BaseViewController {
    @IBOutlet weak var previewView: UIView!
    
    var viewModel: CameraViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CameraViewModel(with: .front,
                                    previewView: previewView,
                                    viewController: self)
        viewModel.viewDidLoad()
        addBackButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }
    
    @IBAction func captureButtonDidClick(_ sender: Any) {
        viewModel.captureImageDidClick { [unowned self] in
            self.viewModel.stopRunning()
        }
    }
}

// MARK: - AVCapturePhotoCaptureDelegate
extension SelfieViewController: AVCapturePhotoCaptureDelegate {
    
    @available(iOS 11.0, *)
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        
        let image = UIImage(data: imageData)
        viewModel.capturedImage = image
        
        let vc = EnterPinViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        let vc = EnterPinViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
