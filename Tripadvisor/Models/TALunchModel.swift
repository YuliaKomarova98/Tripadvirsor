//
//  BRLunchModel.swift
//  BottleRocket
//
//  Created by Yulia on 14.09.2021.
//

import Foundation

struct RestaurantResponse: Codable {
    let restaurants: [Restaurant]
}

// MARK: - Restaurant
struct Restaurant: Codable {
    let name: String
    let backgroundImageURL: String?
    let category: String
    let contact: Contact?
    let location: Location
    
    var phone: String? {
        return contact?.formattedPhone
    }
    var twitter: String? {
        return contact?.twitter
    }
    var facebook: String? {
        return contact?.facebookUsername
    }
    var lat: Double {
        return location.lat
    }
    var lng: Double {
        return location.lng
    }
    var address:String {
        return location.address
    }
    var formattedAddress: String {
        return location.formattedAddress.joined(separator: ", ")
    }
}

// MARK: - Contact
struct Contact: Codable {
    let phone: String
    let formattedPhone: String
    let twitter: String?
    let facebook: String?
    let facebookUsername: String?
    let facebookName: String?
}

// MARK: - Location
struct Location: Codable {
    let address: String
    let crossStreet: String?
    let lat: Double
    let lng: Double
    let postalCode: String?
    let cc: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]
}
