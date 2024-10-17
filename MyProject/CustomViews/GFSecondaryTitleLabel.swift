// GFSecondaryTitleLabel.swift
// MyProject
// Created by Nagarro on 2024/07/22.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

  // This line inherits from UILabel, making GFSecondaryTitleLabel a custom subclass of UILabel.

  // This initializer is called when a new instance of the label is created programmatically. It inherits the initialization behavior from the superclass (UILabel) and then calls the configure() method to set up the label's default properties.
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  // This initializer is required by the NSCoder protocol, but it's not implemented in this case because the label is not designed to be created from archived data.
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // This convenience initializer allows creating a GFSecondaryTitleLabel instance with a specific font size. It calls the main initializer (init(frame:)) and then sets the font with a medium weight.
  convenience init(fontSize: CGFloat) {
    self.init(frame: .zero)
    font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
  }

  // This private method configures the default properties of the label.
  private func configure() {
    textColor = .secondaryLabel // Sets the text color to the system's secondary label color.
    adjustsFontSizeToFitWidth = true // Attempts to adjust the font size to fit the available width while maintaining minimum scale.
    minimumScaleFactor = 0.90 // Sets the minimum scale factor for the font size (no smaller than 90% of the original size).
    lineBreakMode = .byTruncatingTail // Enables line breaking by truncating the end of the text if it overflows the label's width.
    translatesAutoresizingMaskIntoConstraints = false // Disables autoresizing to use constraints for layout.
  }
}
