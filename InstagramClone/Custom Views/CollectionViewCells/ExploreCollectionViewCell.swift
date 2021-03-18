//
//  ExploreCollectionViewCell.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 24/2/21.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    static let CellIdentifier = "ExploreCollectionViewCellID"

    let image: UIImage? = nil

    // MARK - Lifecicle
    override init(frame: CGRect) {
        super.init(frame: frame)

//        configure()
//        buildInterface()
//        setupDefaultLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Init with coder is not supported")
    }
}
