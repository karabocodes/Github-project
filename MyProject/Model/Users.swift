// Users.swift
// MyProject
// Created by Nagarro on 2024/0j22
//

import Foundation

struct User: Codable {

  // This line defines a struct named User that conforms to the Codable protocol. The Codable protocol allows encoding and decoding instances of this struct to and from various data formats like JSON.

  // These properties define the attributes of a user object.
  let login: String // Username for the user.
  let avatarUrl: String // URL of the user's avatar image.
  var name: String? // User's full name (optional).
  var location: String? // User's location (optional).
  var bio: String? // User's biography (optional).
  let publicRepos: Int // Number of public repositories the user has.
  let publicGists: Int // Number of public gists the user has.
  let htmlUrl: String // User's profile URL on the web.
  let following: Int // Number of users the user is following.
  let followers: Int // Number of followers the user has.
  let createdAt: Date // Date and time the user account was created.

  // Since some properties are marked as optional (name, location, bio), they can be nil when decoding data that doesn't include those values.
}
