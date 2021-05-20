//
//  ViewController.swift
//  Where Was I
//
//  Created by Monique Shaqiri on 13.05.21.
//  Copyright © 2021 Monique Shaqiri. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBAction func saveButtonClicked(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        if let lat = coord?.latitude {
            print("Latitude: " + String(lat))
        }
        if let long = coord?.longitude {
            print("Longitude:" + String(long))
        }
    }
    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else{
            print("Location not enabled")
            return
        }
        print("Location allowed")
        mapView.showsUserLocation = true
    }

}

