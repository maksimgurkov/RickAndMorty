//
//  Persone.swift
//  HW3.2
//
//  Created by Максим Гурков on 20.03.2023.
//

import Foundation

struct RickAndMorty: Codable {
    let results: [Result]
}

struct Result: Codable {
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    var description: String {
        """
Name: \(name)
Status: \(status)
Type: \(type)
"""
    }
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

