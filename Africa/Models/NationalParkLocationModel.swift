//
//  LocationsModel.swift
//  Africa
//
//  Created by Harshvardhan Basava on 21/05/21.
//

import SwiftUI
import MapKit

struct NationalParkLocationModel: Codable, Identifiable{
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    //computed property
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
