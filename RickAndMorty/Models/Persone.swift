//
//  Persone.swift
//  HW3.2
//
//  Created by Максим Гурков on 20.03.2023.
//

import Foundation

struct RickAndMorty: Codable {
    let results: [Person]
}

struct Person: Codable {
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]

    var descriptionPerson: String {
        """
    Name: \(name)

    Status: \(status.rawValue)
    Species: \(species.rawValue)
    Gender: \(gender.rawValue)
    """
    }
    
    var fulDescription: String {
        """
    Status: \(status.rawValue)
    Species: \(species.rawValue)
    Type: \(type)
    Gender: \(gender.rawValue)
    Origin: \(origin.name)
    Location: \(location.name)
    """
    }
}

struct Episode: Decodable {
    let name: String
    let date: String
    
    var description: String {
        """
    Title: \(name)
    Date: \(date)
    """
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case date = "air_date"
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

