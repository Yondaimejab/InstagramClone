//
//  SearchBarContainerView.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 24/2/21.
//

import UIKit

class SearchBarContainerView: UIView {

    let searchBar: UISearchBar

    init(customSearchBar: UISearchBar) {
        searchBar = customSearchBar
        super.init(frame: .zero)
        addSubview(searchBar)
    }

    convenience override init(frame: CGRect) {
        self.init(customSearchBar: UISearchBar())
        self.frame = frame
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
