// Copyright (c) 2024 Jan Kowalewicz <jan@nitroosit.de>. Licensed under the MIT License.

import Foundation

struct Buddy: Identifiable, Hashable {
    let id: Int
    var imageActive: String
    var imageInactive: String
}

let buddies = [
    Buddy(id: 0, imageActive: "network", imageInactive: "network.slash"),
    Buddy(id: 1, imageActive: "bolt.horizontal.fill", imageInactive: "bolt.horizontal"),
    Buddy(id: 2, imageActive: "bolt.fill", imageInactive: "bolt.slash"),
    Buddy(id: 3, imageActive: "cable.connector", imageInactive: "cable.connector.slash"),
    Buddy(id: 4, imageActive: "cat.fill", imageInactive: "cat"),
    Buddy(id: 5, imageActive: "dog.fill", imageInactive: "dog"),
    Buddy(id: 6, imageActive: "lizard.fill", imageInactive: "lizard"),
    Buddy(id: 7, imageActive: "pawprint.fill", imageInactive: "pawprint"),
    Buddy(id: 8, imageActive: "leaf.fill", imageInactive: "leaf"),
    Buddy(id: 9, imageActive: "puzzlepiece.fill", imageInactive: "puzzlepiece")
]