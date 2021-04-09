//
//  CameraViewModel.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 31/3/21.
//

import UIKit
import AVFoundation

protocol CameraProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewWillAppear()
    func viewWillDisappear()
    func loadCamera()
}

class CameraViewModel: BaseViewModel, CameraProtocol {
    var frontCamera: AVCaptureDevice? {
        return AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .front
        ).devices.first
    }
    
    var backCamera: AVCaptureDevice? {
        return AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .back
        ).devices.first
    }
    
    private let captureSession = AVCaptureSession()
    private let stillImageOutput = AVCapturePhotoOutput()
    private var previewLayer: AVCaptureVideoPreviewLayer?
    
    let viewController: UIViewController
    
    var cameraState: CameraState = .front
    var capturedImage: UIImage? = nil
    var previewView: UIView!
    
    init(with cameraState: CameraState,
         previewView: UIView,
         viewController: UIViewController) {
        self.cameraState = cameraState
        self.previewView = previewView
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        loadCamera()
    }
    
    func viewDidAppear() {
        previewLayer?.frame = previewView.bounds
    }
    
    func viewWillAppear() {
        restartSession()
    }
    
    func viewWillDisappear() {
        captureSession.stopRunning()
    }
    
    fileprivate func restartSession() {
        guard captureSession.inputs.count != 0 else { return }
        captureSession.startRunning()
    }
    
    func loadCamera() {
        
        // Remove Existing input
        // Case: Swithcing between fron and rear camera
        if let existingInput = captureSession.inputs.first as? AVCaptureDeviceInput {
            captureSession.removeInput(existingInput)
            // Begin new session configuration and defer commit
            captureSession.beginConfiguration()
            do {
                captureSession.commitConfiguration()
            }
        }
        
        var error: NSError?
        var input: AVCaptureDeviceInput!
        guard let camera = cameraState == .front ? frontCamera : backCamera else { return }
        
        do {
            input = try AVCaptureDeviceInput(device: camera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        guard error == nil && captureSession.canAddInput(input) else { return }
        captureSession.addInput(input)
        
        guard captureSession.canAddOutput(stillImageOutput) else { return }
        captureSession.addOutput(stillImageOutput)
        
        // Remove existing preview layer
        if previewLayer != nil {
            previewLayer?.removeFromSuperlayer()
            previewLayer = nil
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
        
        previewView.layer.insertSublayer(previewLayer!, at: 0)
    }
    
    
    func stopRunning() {
        captureSession.stopRunning()
    }
    
    func captureImageDidClick(completion: @escaping () -> Void) {
        guard stillImageOutput.connection(with: AVMediaType.video) != nil else {
            completion()
            return
        }
        
        let settings = AVCapturePhotoSettings()
        if #available(iOS 11.0, *) {
            settings.livePhotoVideoCodecType = .jpeg
        }
        
        guard let delegate = viewController as? AVCapturePhotoCaptureDelegate else { return }
        stillImageOutput.capturePhoto(with: settings, delegate: delegate)
    }
}
