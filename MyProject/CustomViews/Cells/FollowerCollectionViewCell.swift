//
// FollowerCollectionViewCell.swift
// MyProject
//
// Created by Nagarro on 2024/07/22.
//

// This line imports the UIKit framework, which provides essential components for building user interfaces in iOS applications.
import UIKit

// This class defines a custom UICollectionViewCell subclass named FollowerCollectionViewCell. UICollectionViewCell is the base class for cells used in collection views.
class FollowerCollectionViewCell: UICollectionViewCell {

  // This static property defines a reuse identifier for the cell. This identifier is used by collection views to manage and reuse cells efficiently.
  static let reuseID = "FollowerCell"

  // This variable creates an instance of GFAvatarImageView, likely a custom image view class designed to display avatars. The frame is initialized to .zero, which represents a rectangle with an origin of (0, 0) and a size of (0, 0).
  let avatarImageView = GFAvatarImageView(frame: .zero)

  // This variable creates an instance of GFTitleLable, likely a custom label class designed for titles. The text alignment is set to center and the font size is set to 16.
  let usernameLabel = GFTitleLable(textAlignment: .center, fontSize: 16)

  // This initializer is called when a new instance of the cell is created programmatically. It inherits the initialization behavior from the superclass (UICollectionViewCell) and then calls the configure() method to set up the cell's layout.
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  // This initializer is required by the NSCoder protocol, but it's not implemented in this case because the cell is not designed to be created from archived data.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // This method sets the data for the cell. It takes a Follower object as input, which likely contains properties like login (username) and avatarUrl (avatar image URL).
  func set(follower: Follower) {
    usernameLabel.text = follower.login
    avatarImageView.downloadImage(fromURL: follower.avatarUrl)

    // This line assumes there's a downloadImage method implemented in GFAvatarImageView to download and display the image from the provided URL.
  }

  // This private method configures the layout of the cell's subviews (avatarImageView and usernameLabel).
  private func configure() {
    addSubview(avatarImageView)
    addSubview(usernameLabel)

    // Disabling translatesAutoresizingMaskIntoConstraints allows for programmatic layout using constraints.
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    usernameLabel.translatesAutoresizingMaskIntoConstraints = false

    let padding: CGFloat = 8 // This defines a padding value used in the constraints.

    // This section creates and activates NSLayoutConstraint objects to define the layout of the subviews.
    NSLayoutConstraint.activate([
      avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding), // Top constraint for avatarImageView relative to cell's top with padding.
      avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding), // Leading constraint for avatarImageView relative to cell's leading edge with padding.
      avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding), // Trailing constraint for avatarImageView relative to cell's trailing edge with negative padding.
      avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor), // Constraint to make the avatar image view square.

      usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12), // Top constraint for usernameLabel relative to bottom of avatarImageView with padding.
      usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding), // Leading constraint for usernameLabel relative to cell's leading edge with padding.
      usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding), // Trailing constraint for usernameLabel relative to cell's trailing edge with negative padding.
      usernameLabel.heightAnchor.constraint(equalToConstant: 20) // Constraint to set the height of the usernameLabel to 20.
    ])
  }
}
