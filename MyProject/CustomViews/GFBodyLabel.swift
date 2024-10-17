// GFBodyLabel.swift
// MyProject
// Created by Nagarro on 2024/07/22.
//

import UIKit

class GFBodyLabel: UILabel {

  // This line inherits from UILabel, making GFBodyLabel a custom subclass of UILabel.

  // This initializer is called when a new instance of the label is created programmatically. It inherits the initialization behavior from the superclass (UILabel) and then calls the configure() method to set up the label's default properties.
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  // This initializer is required by the NSCoder protocol, but it's not implemented in this case because the label is not designed to be created from archived data.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // This convenience initializer allows creating a GFBodyLabel instance with a specific text alignment. It calls the main initializer (init(frame:)) and then sets the text alignment property.
  convenience init(textAlignment: NSTextAlignment) {
    self.init(frame: .zero)
    self.textAlignment = textAlignment
  }

  // This private method configures the default properties of the label.
  private func configure() {
    textColor = .secondaryLabel // Sets the text color to the system's secondary label color.
    font = UIFont.preferredFont(forTextStyle: .body) // Sets the font to the system's preferred body text font.
    adjustsFontForContentSizeCategory = true // Allows the font size to adjust based on the user's content size category preference.
    adjustsFontSizeToFitWidth = true // Attempts to adjust the font size to fit the available width while maintaining minimum scale.
    minimumScaleFactor = 0.75 // Sets the minimum scale factor for the font size (no smaller than 75% of the original size).
    lineBreakMode = .byWordWrapping // Enables line wrapping based on whole words.
    translatesAutoresizingMaskIntoConstraints = false // Disables autoresizing to use constraints for layout.
  }
}
