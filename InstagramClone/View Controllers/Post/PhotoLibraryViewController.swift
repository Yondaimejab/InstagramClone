//
//  PhotoLibraryViewController.swift
//  InstagramClone
//
//  Created by joel Alcantara on 18/5/21.
//

import UIKit

class PhotoLibraryViewController: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseImageButton: UIButton!
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            picker.delegate = self
            picker.sourceType = .savedPhotosAlbum
            picker.allowsEditing = false
            picker.modalPresentationStyle = .fullScreen
            present(picker, animated: true)
        }
    }
    
    
    @IBAction func presetPicker(_ sender: Any) {
        present(picker, animated: true)
    }
    
}

extension PhotoLibraryViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else {return}
        imageView.image = image
        picker.dismiss(animated: true)
    }
}
