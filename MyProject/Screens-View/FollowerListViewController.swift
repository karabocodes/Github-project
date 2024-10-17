// FollowerListViewController.swift
// MyProject
// Created by Nagarro on 2024/07/20.

import UIKit // Importing the UIKit framework for building and managing the iOS app's user interface.

class FollowerListViewController: UIViewController {

  // Enumeration to define sections for the collection view
  enum Section {
    case main
  }

  // Variables
  var username: String! // Username passed from SearchViewController
  var followers: [Follower] = [] // Array to store follower data

  // Collection view and data source properties
  var collectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!

  // Method called after the view controller's view has been loaded into memory
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewController() // Configure basic view controller properties
    configureCollectionView() // Configure collection view layout and add it to the view
    getFollowers() // Fetch follower data for the provided username
    configureDataSource() // Configure the collection view data source
  }

  // Configure basic view controller properties
  func configureViewController() {
    view.backgroundColor = .systemBackground // Set the view's background color to the system background color
    navigationController?.isNavigationBarHidden = false // Show navigation bar
    navigationController?.navigationBar.prefersLargeTitles = true // Enable large titles
  }

  // Configure collection view layout and add it to the view
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view)) // Assuming UIHelper provides a three-column flow layout
    view.addSubview(collectionView) // Add the collection view to the view
    collectionView.backgroundColor = .systemBackground // Set the collection view's background color to the system background color
    collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseID) // Register the cell class for the collection view
  }

  // Fetch follower data for the provided username
  func getFollowers() {
    NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
      guard let self = self else { return } // Ensure self is not nil

      switch result {
      case .success(let followers):
        self.followers = followers // Update the followers array with the fetched data
        self.updateData() // Update the collection view with the fetched data

      case .failure(let error):
        self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: error.rawValue, buttonTitle: "OK") // Present an alert if there's an error
      }
    }
  }

  // Configure the collection view data source
  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView) { (collectionView, indexPath, follower) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseID, for: indexPath) as! FollowerCollectionViewCell // Dequeue a reusable cell
      cell.set(follower: follower) // Set follower data in the cell
      return cell // Return the configured cell
    }
  }

  // Update the collection view with the fetched follower data
  func updateData() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>() // Create a new snapshot
    snapshot.appendSections([.main]) // Add the main section to the snapshot
    snapshot.appendItems(followers) // Add the followers to the snapshot
    DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) } // Apply the snapshot to the data source on the main thread
  }
}
