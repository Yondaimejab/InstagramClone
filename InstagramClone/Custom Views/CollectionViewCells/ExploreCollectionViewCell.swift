//
//  ExploreCollectionViewCell.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 24/2/21.
//

import UIKit
import Anchorage

class ExploreCollectionViewCell: UICollectionViewCell {
    static let CellIdentifier = "ExploreCollectionViewCellID"

    private let imageView = UIImageView()
    
    var itemImage: UIImage? {
        get {
            imageView.image
        }
        set {
            if let image = newValue {
                imageView.image = image
            }
        }
    }
    
    // MARK - Lifecicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        displayDefaultLayout()
    }
    
    private func displayDefaultLayout() {
        self.addSubview(imageView)
        self.imageView.edgeAnchors == edgeAnchors
    }

    required init?(coder: NSCoder) {
        fatalError("Init with coder is not supported")
    }
}
