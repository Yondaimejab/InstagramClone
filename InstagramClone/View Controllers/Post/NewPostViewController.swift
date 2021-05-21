//
//  NewPostViewController.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit

enum NewPostPagesToShow: Int {
    case library, camera
    
    var identifier: String {
        switch self {
        case .camera:
            return "CameraVC"
        case .library:
            return "PhotoVC"
        }
    }
    
    static var pagesToShow: [NewPostPagesToShow] {
        return [.library, .camera]
    }
}

class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addNAvigationItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func goToLibrary(_ sender: Any) {
        let notification = Notification(name: NSNotification.Name("NewPage"), object: NewPostPagesToShow.library)
        NotificationCenter.default.post(notification)
    }
    
    @IBAction func goToTheCamera(_ sender: Any) {
        let notification = Notification(name: NSNotification.Name("NewPage"), object: NewPostPagesToShow.camera)
        NotificationCenter.default.post(notification)
    }
    
}
