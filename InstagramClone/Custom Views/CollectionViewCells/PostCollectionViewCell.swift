//
//  PostCollectionViewCell.swift
//  InstagramClone
//
//  Created by Joel Alcantara burgos on 20/2/21.
//

import UIKit
import Anchorage

class PostCollectionViewCell: UICollectionViewCell {

    // Constants
    enum Constants {
        static let profileImageContainerWidth = 60.0
        static let profileImageWidth = 40.0
        static let userInfoStackViewHeight = 50.0
        static let actionButtonsSize = CGSize(width: 25.0, height: 25.0)
    }

    // MARK - Properties
    var containerView = UIView()

    var userInfoStackView = UIStackView()
    var userProfileImageContainer = UIView()
    var userImageView = UIImageView()
    var userNameButton = UIButton()
    var moreButton = UIButton()
    var postImageView = UIImageView()
    var actionButtonsStackView = UIStackView()
    var likeButton = UIButton()
    var commentButton = UIButton()
    var sendButton = UIButton()
    var saveToCollectionButtonContainer = UIView()
    var saveCollectionButton = UIButton()

    var amountOfLikesLabel = UILabel()
    var statusLabel = UILabel()
    var viewCommentsButton = UIButton()
    var dateLabel = UILabel()

    // MARK - Properties
    var post: Post? = nil

    func bindTo(post: Post) {
        self.post = post
        setUpPost()
    }

    // MARK - Lifecicle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        buildInterface()
        setupDefaultLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Init with coder is not supported")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK - Private
    private func configure() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 2
        self.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor

        userImageView.image = UIImage(named: "user1")?.withRenderingMode(.alwaysOriginal)
        postImageView.image =  UIImage(named: "user1")?.withRenderingMode(.alwaysOriginal)

        actionButtonsStackView.spacing = 20

        likeButton.setImage(UIImage(named: "like_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        commentButton.setImage(UIImage(named: "comment_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        sendButton.setImage(UIImage(named: "send_icon"), for: .normal)
        saveCollectionButton.setImage(UIImage(named: "collect_icon"), for: .normal)
        moreButton.titleLabel?.text = ""
        moreButton.setImage(UIImage(named: "more_icon")?.withRenderingMode(.alwaysOriginal), for: .normal)

        userNameButton.setTitle("Joel0729", for: .normal)
        userNameButton.setTitleColor(.black, for: .normal)

        statusLabel.numberOfLines = 6
        statusLabel.lineBreakMode = .byTruncatingTail
        statusLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        statusLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus malesuada" +
        "odio ut magna lacinia, a venenatis nunc tristique. Proin sed lacus vehicula, fringilla lorem nec," +
        " lobortis erat. Sed quam lectus, viverra et dapibus in, tempor eget libero. Morbi efficitur ante at elit porta, nec volutpat diam fringilla. Etiam"
        viewCommentsButton.setTitle("View Commets", for: .normal)
        viewCommentsButton.setTitleColor(.lightGray, for: .normal)
        viewCommentsButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        viewCommentsButton.titleLabel?.textAlignment = .center

        amountOfLikesLabel.text = "3000 likes"
        amountOfLikesLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        dateLabel.text = "july 29, 1999"
        dateLabel.font = .systemFont(ofSize: 12, weight: .light)
    }

    private func buildInterface() {
        addSubview(containerView)

        userInfoStackView.addArrangedSubview(userProfileImageContainer)
        userProfileImageContainer.addSubview(userImageView)
        userInfoStackView.addArrangedSubview(userNameButton)
        userInfoStackView.addArrangedSubview(moreButton)

        containerView.addSubview(userInfoStackView)
        containerView.addSubview(postImageView)

        containerView.addSubview(actionButtonsStackView)
        actionButtonsStackView.addArrangedSubview(likeButton)
        actionButtonsStackView.addArrangedSubview(commentButton)
        actionButtonsStackView.addArrangedSubview(sendButton)
        actionButtonsStackView.addArrangedSubview(saveToCollectionButtonContainer)
        saveToCollectionButtonContainer.addSubview(saveCollectionButton)

        containerView.addSubview(amountOfLikesLabel)
        containerView.addSubview(statusLabel)
        containerView.addSubview(viewCommentsButton)
        containerView.addSubview(dateLabel)
    }

    private func setupDefaultLayout() {
        containerView.edgeAnchors == self.edgeAnchors

        userInfoStackView.leadingAnchor == containerView.leadingAnchor + 20
        userInfoStackView.trailingAnchor == containerView.trailingAnchor - 20
        userInfoStackView.heightAnchor == Constants.userInfoStackViewHeight
        userInfoStackView.topAnchor == containerView.topAnchor

        userProfileImageContainer.widthAnchor == Constants.profileImageContainerWidth
        userImageView.sizeAnchors == CGSize(width: Constants.profileImageWidth, height: Constants.profileImageWidth)
        userImageView.centerXAnchor == userProfileImageContainer.centerXAnchor
        userImageView.centerYAnchor == userProfileImageContainer.centerYAnchor

        userImageView.cornerRadius = 20
        userImageView.layer.masksToBounds = true
        moreButton.widthAnchor == Constants.profileImageContainerWidth

        postImageView.topAnchor == userInfoStackView.bottomAnchor
        postImageView.widthAnchor == containerView.widthAnchor
        postImageView.centerXAnchor == containerView.centerXAnchor

        actionButtonsStackView.topAnchor == postImageView.bottomAnchor + 12
        actionButtonsStackView.leadingAnchor == containerView.leadingAnchor + 20
        actionButtonsStackView.trailingAnchor == containerView.trailingAnchor - 20
        actionButtonsStackView.heightAnchor == Constants.actionButtonsSize.height

        likeButton.widthAnchor == Constants.actionButtonsSize.width
        commentButton.widthAnchor == Constants.actionButtonsSize.width
        sendButton.widthAnchor == Constants.actionButtonsSize.width

        saveCollectionButton.sizeAnchors == Constants.actionButtonsSize
        saveCollectionButton.trailingAnchor == saveToCollectionButtonContainer.trailingAnchor
        saveCollectionButton.centerYAnchor == saveToCollectionButtonContainer.centerYAnchor

        amountOfLikesLabel.topAnchor == actionButtonsStackView.bottomAnchor + 12
        amountOfLikesLabel.leadingAnchor == containerView.leadingAnchor + 20
        amountOfLikesLabel.trailingAnchor == containerView.trailingAnchor - 20

        statusLabel.leadingAnchor == containerView.leadingAnchor + 20
        statusLabel.trailingAnchor == containerView.trailingAnchor - 20
        statusLabel.topAnchor == amountOfLikesLabel.bottomAnchor

        viewCommentsButton.topAnchor == statusLabel.bottomAnchor + 8
        viewCommentsButton.heightAnchor == (Constants.actionButtonsSize.height - 15.0)
        viewCommentsButton.leadingAnchor == containerView.leadingAnchor + 20
        viewCommentsButton.trailingAnchor == containerView.trailingAnchor - 20

        dateLabel.topAnchor == viewCommentsButton.bottomAnchor + 8
        dateLabel.bottomAnchor == containerView.bottomAnchor - 12
        dateLabel.leadingAnchor == containerView.leadingAnchor + 20
        dateLabel.trailingAnchor == containerView.trailingAnchor - 20
    }

    private func setUpPost() {
        guard let post = self.post else {return}
        userNameButton.setTitle(post.user.userName, for: .normal)
        postImageView.loadImageFrom(url: post.postImageURL)
        userImageView.loadImageFrom(url: post.user.userImageURL)
        amountOfLikesLabel.text = "\(post.likesCount)"
        statusLabel.text = post.postComment
        dateLabel.text = post.datePosted.short
    }
}
