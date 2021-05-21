//
//  CameraViewController.swift
//  InstagramClone
//
//  Created by joel Alcantara on 18/5/21.
//

import UIKit

class CameraViewController: UIViewController {

    @IBOutlet weak var simpleCameraView: SimpleCameraView!
    
    var simpleCamera: SimpleCamera!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        simpleCamera = SimpleCamera(cameraView: simpleCameraView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        simpleCamera.startSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        simpleCamera.stopSession()
    }
    
    @IBAction func startCapture(_ sender: Any) {
        switch simpleCamera.currentCaptureMode {
        case .photo:
            simpleCamera.takePhoto { context, success in
                guard let image = UIImage(data: context!) else {return }
                self.imageView.image = image
            }
        case .video:
            break
        }
    }
    
    
    @IBAction func toggleCaptureMode(_ sender: Any) {
        switch simpleCamera.currentCaptureMode {
        case .photo:
            simpleCamera.currentCaptureMode = .video
            modeButton.setImage(UIImage(systemName: "video"), for: .normal)
        case .video:
            simpleCamera.currentCaptureMode = .photo
            modeButton.setImage(UIImage(systemName: "camera"), for: .normal)
        }
    }
    
    @IBOutlet weak var modeButton: UIButton!
    
}
