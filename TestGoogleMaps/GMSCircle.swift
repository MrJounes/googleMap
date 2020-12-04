//
//  GMSCircle.swift
//  TestGoogleMaps
//
//  Created by Igor Dikan on 04.12.2020.
//

import GoogleMaps

extension GMSCircle {
    
    func bounds() -> GMSCoordinateBounds {
        func locationMinMax(_ positive: Bool) -> CLLocationCoordinate2D {
            let sign: Double = positive ? 1 : -1
            let dx = sign * self.radius / 6378000 * (180 / .pi)
            let lat = position.latitude + dx
            let lon = position.longitude + dx / cos(position.latitude * .pi / 180)
            return CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        
        return GMSCoordinateBounds(coordinate: locationMinMax(true), coordinate: locationMinMax(false))
    }
}
