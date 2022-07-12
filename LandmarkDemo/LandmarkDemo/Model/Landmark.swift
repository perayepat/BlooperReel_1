//
//  Landmark.swift
//  LandmarkDemo
//
//  Created by IACD-013 on 2022/06/10.
//

import Foundation
import SwiftUI
import CoreLocation

//adding identifiable allows each landmark to be decoded
struct Landmark: Hashable, Codable, Identifiable{
    var id: Int
    var name:String
    var park:String
    var state:String
    var description: String
    var isFavorite: Bool
    
    //loading images using the images names
    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    //Add coordinates property
    private var coordinates: Coordinates
    //Location Coordinate property thats useful for mapkit data
    var locationCoordinates: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}
