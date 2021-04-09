//
//  CameraPreviewViewController.swift
//  sathapana-mobile-app
//
//  Created by Sovanndy Ul on 30/3/21.
//

import UIKit

protocol CameraPreviewDelegate: NSObjectProtocol {
    func backDidClick()
}

final class CameraPreviewViewController: BaseViewController {
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shareButtonBackView: UIView!
    @IBOutlet weak var deleteView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var canvasImageView: UIImageView!
    
    weak var delegate: CameraPreviewDelegate? = nil
    var capturedImage: UIImage!
    var outputImage: UIImage?
    
    var lastPanPoint: CGPoint?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackButton()
        setupView()
    }
    
    // MARK: - Private
    private func setupView() {
        // Display image
        imageView.image = capturedImage
    }
    
    // MARK: - Actions
    @IBAction func backButtonDidClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
        self.delegate?.backDidClick()
    }
    
    @IBAction func saveButtonDidClick(_ sender: Any) {
        if let outputImage = self.outputImage {
            UIImageWriteToSavedPhotosAlbum(outputImage, nil, nil, nil)
        } else {
            UIImageWriteToSavedPhotosAlbum(capturedImage, nil, nil, nil)
        }
        
    }
    
    @IBAction func shareButtonDidClick(_ sender: UIButton) {
        
        var renderedImage: UIImage! = capturedImage
        if let image = self.outputImage {
            renderedImage = image
        }
            
        // Show Social Sharing
        let activityViewController = UIActivityViewController(activityItems: [renderedImage as Any], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [ .airDrop ]
        
        activityViewController.popoverPresentationController?.sourceView = sender
        activityViewController.popoverPresentationController?.sourceRect = sender.bounds
        activityViewController.popoverPresentationController?.permittedArrowDirections = .any
        self.present(activityViewController, animated: true, completion: { })
    }
    
    @IBAction func stickerButtonDidClick(_ sender: Any) {

    }
}
