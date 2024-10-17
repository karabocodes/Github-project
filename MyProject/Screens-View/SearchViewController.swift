//
//  SearchViewController.swift
//  MyProject
//
//  Created by Nagarro on 2024/07/19.
//

import UIKit // Importing UIKit framework for building and managing the iOS app's user interface.

class SearchViewController: UIViewController {
    
    // Creating an instance of UIImageView for displaying a logo.
    let logoImageView = UIImageView()
    
    // Creating an instance of GFTextField for entering the username.
    let usernametextfield = GFTextField()
    
    // Creating an instance of GFButton for the call-to-action button with a green background and "Get Followers" title.
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    // Computed property to check if the username text field is not empty.
    var isUsernameEntered: Bool {
        return !usernametextfield.text!.isEmpty
    }
    
    // Called after the view controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // Setting the view's background color to the system background color.
        
        configureLogoImageView() // Configuring the logo image view.
        configureTextfield() // Configuring the username text field.
        configureCallToActionButton() // Configuring the call-to-action button.
        createDissmisssKeyboardTapGesture() // Creating a gesture to dismiss the keyboard when tapping outside of it.
    }
    
    // Method to create a tap gesture recognizer to dismiss the keyboard.
    func createDissmisssKeyboardTapGesture (){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)) // Creating a tap gesture recognizer.
        view.addGestureRecognizer(tap) // Adding the gesture recognizer to the view.
    }
    
    // Method to handle the button tap and push the FollowerListViewController.
    @objc func pushFollowerListVC(){
        
        guard isUsernameEntered else { // Check if the username is entered, if not present an alert.
            presentGFAlertOnMainThread(title: "Empty User name", message: "Please insert a valid username😇", buttonTitle: "OK")
            return
        }
        let followerListVC = FollowerListViewController() // Creating an instance of FollowerListViewController.
        followerListVC.username = usernametextfield.text // Setting the username property of the followerListVC.
        followerListVC.title = usernametextfield.text // Setting the title of the followerListVC.
        navigationController?.pushViewController(followerListVC, animated: true) // Pushing the followerListVC onto the navigation stack.
    }
    
    // Called before the view appears on the screen.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true // Hiding the navigation bar.
    }
    
    // Method to configure the logo image view.
    func configureLogoImageView() {
        view.addSubview(logoImageView) // Adding the logoImageView to the view.
        logoImageView.translatesAutoresizingMaskIntoConstraints = false // Disabling autoresizing mask constraints.
        logoImageView.image = UIImage(named: "gh-logo") // Setting the image of the logoImageView.
        
        // Activating layout constraints for the logoImageView.
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    // Method to configure the username text field.
    func configureTextfield() {
        view.addSubview(usernametextfield) // Adding the usernametextfield to the view.
        usernametextfield.delegate = self // Setting the view controller as the delegate of the text field.
        
        // Activating layout constraints for the usernametextfield.
        NSLayoutConstraint.activate([
            usernametextfield.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernametextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernametextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), // Ensure negative value
            usernametextfield.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    // Method to configure the call-to-action button.
    func configureCallToActionButton(){
        view.addSubview(callToActionButton) // Adding the callToActionButton to the view.
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside) // Adding a target-action for the button tap.
        
        // Activating layout constraints for the callToActionButton.
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// Extension to conform to UITextFieldDelegate protocol.
extension SearchViewController: UITextFieldDelegate {
    // Method to handle the return key tap in the text field.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Did tap return") // Printing a message to the console.
        return true // Allowing the return key to dismiss the keyboard.
    }
}
