//
//  ViewController.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit

class HomeViewController: UIViewController {

    typealias PostDataSource = UICollectionViewDiffableDataSource<Sections, HomeCollectionViewRepresentable>

    enum Sections {
        case main
        case secundary
    }

    //Constants

    enum Constants {
        static let estimatedRowHeight: CGFloat = 80.0
        static let storyCollectionViewCellIdentifier = "StoryCollectionViewCellIdentifier"
        static let postCollectionViewCellIdentifier = "PostCollectionViewCellIdentifier"
    }

    // Outlets
    @IBOutlet weak var containerView: UIView!


    // Properties
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var homeViewModel = HomeControllerViewModel()
    private var dataSource: PostDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        updateDataSource(with: homeViewModel)
    }

    private func setupViews() {

        // navigation item
        let rightBarItemImage = UIImage(named: "send_nav_icon")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: nil, action: nil)

        let leftBarItemImage = UIImage(named: "camera_nav_icon")?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarItemImage, style: .plain, target: nil, action: nil)

        let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon"))
        navigationItem.titleView = profileImageView

        // Configure collectionView
        setUpCollectionView()
    }

    private func setUpCollectionView() {
        homeCollectionView.collectionViewLayout = createCollectionViewLayout()
        homeCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        homeCollectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: Constants.postCollectionViewCellIdentifier)
        homeCollectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: Constants.storyCollectionViewCellIdentifier)
        createDataSource()
        homeCollectionView.dataSource = dataSource
    }

    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (sectionNumber, env) -> NSCollectionLayoutSection? in

            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(1)))

                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10)

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(Constants.estimatedRowHeight)), subitems: [item])

                group.contentInsets.bottom = 12


                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            } else if sectionNumber == 1 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))

                item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0)

                let gruoup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.9)), subitems: [item])

                let section = NSCollectionLayoutSection(group: gruoup)

                return section
            }
            return nil
        }
    }

    private func createDataSource() {
        dataSource = PostDataSource(collectionView: homeCollectionView, cellProvider: { (collectionView, indexPath, homeRepresentable) -> UICollectionViewCell? in

            var cell: UICollectionViewCell? = nil
            switch homeRepresentable {
            case .story(let story):
                guard indexPath.section == 0 else { return cell }
                let storyCellRegistration = UICollectionView.CellRegistration<StoryCollectionViewCell, Story> { cell, indexPath, item in
                    cell.bindTo(story: story)
                }
                cell = collectionView.dequeueConfiguredReusableCell(using: storyCellRegistration, for: indexPath, item: story)
            case .post(let post):
                guard indexPath.section == 1 else { return cell }
                let postCellRegistration = UICollectionView.CellRegistration<PostCollectionViewCell, Post> { cell, indexPath, item in
                    cell.bindTo(post: item)
                }
                cell = collectionView.dequeueConfiguredReusableCell(using: postCellRegistration, for: indexPath, item: post)
            }
            return cell
        })
    }

    private func updateDataSource(with viewModel: HomeControllerViewModel) {
        var snapShot = NSDiffableDataSourceSnapshot<Sections, HomeCollectionViewRepresentable>()
        snapShot.appendSections([.main, .secundary])

        snapShot.appendItems(viewModel.listStoryRepresentable(), toSection: .main)
        snapShot.appendItems(viewModel.listPostRepresentable(), toSection: .secundary)

        dataSource.apply(snapShot)
    }
    

}
