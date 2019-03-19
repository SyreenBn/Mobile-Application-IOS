//
//  File.swift
//  Landmarks
//
//  Created by Syreen Banabilah on 3/19/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation
class Landmark: NSObject, MKAnnotation { let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) { self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        super.init()
        
    }
}
