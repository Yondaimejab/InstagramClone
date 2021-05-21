//
//  SearchViewController.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit
import Anchorage

class SearchViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    typealias ImageDataSource = UICollectionViewDiffableDataSource<Section, UIImage>
    typealias ImageDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, UIImage>

    let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let mediumItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
    let featuredItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .fractionalHeight(1.0))
    let verticaltemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(1.0))
    let horizontaltemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(300))
    var viewData: [UIImage] = [] {
        didSet {
            updateDataSource()
        }
    }
    var imagesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var dataSource: ImageDataSource!
    var exploreViewModel = ExploreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTitle()
        configureSearchBar()
        configureCollectionView()
    }
    
    private func configureTitle() {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 17, weight: .regular)
        titleLabel.textColor = .darkGray
        titleLabel.layer.shadowColor = UIColor.black.cgColor
        titleLabel.layer.shadowRadius = 15.0
        titleLabel.layer.shadowOffset = .zero
        titleLabel.layer.shadowOpacity =  0.7
        titleLabel.layer.shadowPath = UIBezierPath(rect: titleLabel.frame).cgPath
        titleLabel.text = "Search new Things"
        navigationItem.titleView = titleLabel
    }
    
    private func configureCollectionView() {
        view.addSubview(imagesCollectionView)
        imagesCollectionView.horizontalAnchors == view.horizontalAnchors + 4
        imagesCollectionView.topAnchor == view.layoutMarginsGuide.topAnchor
        imagesCollectionView.bottomAnchor == view.bottomAnchor
        imagesCollectionView.collectionViewLayout = createDefaultLayout()
        imagesCollectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: "ExploreCollectionViewCellID")
        imagesCollectionView.dataSource = dataSource
        imagesCollectionView.backgroundColor = .white
        dataSource = ImageDataSource(collectionView: imagesCollectionView, cellProvider: { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCellID", for: indexPath)
            if let exploreCell = cell as? ExploreCollectionViewCell {
                exploreCell.itemImage = item
            }
            cell.backgroundColor = .blue.withAlphaComponent(0.4)
            return cell
        })
        viewData = exploreViewModel.getExploreItems()
    }
    
    private func configureSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.definesPresentationContext = true
        searchController.searchBar.placeholder = "Discover"
        searchController.searchResultsUpdater = self
    }
    
    private func createDefaultLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, enviroment in
            let mediumItem = NSCollectionLayoutItem(layoutSize: self.mediumItemSize)
            let featuredItem = NSCollectionLayoutItem(layoutSize: self.featuredItemSize)
            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: self.verticaltemSize, subitem: mediumItem, count: 2)
            verticalGroup.interItemSpacing = .fixed(2)
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: self.horizontaltemSize, subitems: [featuredItem, verticalGroup])
            horizontalGroup.subitems.first?.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 2)
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.interGroupSpacing = 2
            return section
        }
    }
    
    private func updateDataSource() {
        var snapshot = ImageDataSourceSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewData, toSection: .main)
        dataSource.apply(snapshot)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchTerm = searchController.searchBar.text, !searchTerm.isEmpty else {return}
        // TODO: Implement Search
    }
}
