// UIViewController+Ext.swift
// MyProject
// Created by Nagarro on 2024/07/22.
//

import UIKit

extension UIViewController {

  // This line extends the functionality of UIViewController by adding a new method.

  // This method, named `presentGFAlertOnMainThread`, takes three string arguments: title, message, and buttonTitle. It's likely used to present a GFAlertViewController instance with the provided details.
  func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      // This block is executed on the main thread.

      let alertViewController = GFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
      // Creates a new GFAlertViewController instance with the provided title, message, and button title.

      alertViewController.modalPresentationStyle = .overFullScreen
      // Sets the modal presentation style to overFullScreen, which displays the alert over the entire screen, covering the underlying view controller.

      alertViewController.modalTransitionStyle = .crossDissolve
      // Sets the modal transition style to crossDissolve, which creates a smooth dissolve effect when presenting and dismissing the alert.

      self.present(alertViewController, animated: true)
      // Presents the created alert view controller modally and with animation.
    }
  }
}
