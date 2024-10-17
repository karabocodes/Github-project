// Follower.swift
// MyProject
// Created by Nagarro on 2024/07/22
//

import Foundation

struct Follower: Codable, Hashable {

  // This line defines a struct named Follower that conforms to the Codable and Hashable protocols. The Codable protocol allows encoding and decoding instances of this struct to and from various data formats like JSON. The Hashable protocol allows instances to be used as keys in dictionaries and sets.

  // These properties define the basic attributes of a follower object.
  var login: String // Username for the follower.
  var avatarUrl: String // URL of the follower's avatar image.

  // Since all properties are non-optional, they must have values when creating a Follower instance.
}
