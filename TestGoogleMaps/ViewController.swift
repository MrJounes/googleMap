//
//  ViewController.swift
//  TestGoogleMaps
//
//  Created by Igor Dikan on 04.12.2020.
//

import GoogleMaps
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    
    // Coordinates of Volgograd
    let latitude: CLLocationDegrees = 48.71939
    let longitude: CLLocationDegrees = 44.50183
    
    let circle = GMSCircle()
    
    let geocoder = GMSGeocoder()
    var currentAddress = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        
//        geocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)) { [weak self] (response, error) in
//            print(123)
//            print(response?.firstResult()?.lines)
//            let addressLines = response?.firstResult()?.lines?[0]
//            print(321)
//            print(addressLines!)
//            self?.currentAddress = addressLines!
//        }
//
//        self.addressLabel.text = currentAddress
    }

    private func setupMap() {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 12.0)
        mapView.camera = camera
    }
}

extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        let location: CLLocation = CLLocation(latitude: position.target.latitude, longitude: position.target.longitude)
        
        let locLatitude = location.coordinate.latitude
        let locLongitude = location.coordinate.longitude
        
        var address: String? = ""
        
        geocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D.init(latitude: locLatitude, longitude: locLongitude)) { (response, error) in
            print(123)
            let addressLines = (response?.firstResult()?.lines?[0])! as String
            print(addressLines)
            print(321)
            address = addressLines
            print(address!)
            print(555)
        }
        
        //print("Координаты: широта: \(Float(locLatitude)) долгота: \(Float(locLongitude))")
        //self.addressLabel.text = "Координаты: \n широта: \(Float(locLatitude)) \n долгота: \(Float(locLongitude))"
        self.addressLabel.text = address
    }
}

