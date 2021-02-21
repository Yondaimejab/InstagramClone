//
//  StoryCollectionViewCell.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit
import Anchorage

class StoryCollectionViewCell: UICollectionViewCell {

    // MARK - Properties
    var userImageView: UIImageView = UIImageView()
    var nameLabel: UILabel = UILabel()
    var story: Story? = nil

    func bindTo(story: Story) {
        self.story = story
        setupView()
    }

    // Lifecicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        buildInterface()
        setupDefaultLayout()
    }

    required init?(coder: NSCoder) {
       fatalError("no init with coder provided")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK - Private

    private func configure() {
        nameLabel.text = "Juan"
        userImageView.image = UIImage(named: "user1")
        userImageView.layer.masksToBounds = true
    }

    private func buildInterface() {
        self.addSubview(nameLabel)
        self.addSubview(userImageView)
    }

    private func setupDefaultLayout() {
        userImageView.centerXAnchor == centerXAnchor
        userImageView.centerYAnchor == centerYAnchor
        userImageView.sizeAnchors == CGSize(width: 45, height: 45)
        userImageView.cornerRadius = 22.5

        nameLabel.topAnchor == userImageView.bottomAnchor
        nameLabel.centerXAnchor == centerXAnchor
    }

    private func setupView() {
        guard let story = story else { return }
        userImageView.loadImageFrom(url: story.user.userImageURL)
        nameLabel.text = story.user.userName
    }

}
