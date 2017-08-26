//
//  ViewController.swift
//  Beacon
//
//  Created by Pato Saldivar on 26/08/17.
//  Copyright © 2017 Pato Saldivar. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController,CLLocationManagerDelegate  {

    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID (uuidString:"B9407F30-F5F8-466E-AFF9-25556B57FE6D")! as UUID, identifier: "Roca Azul")
    let colors = [
        61953: UIColor (red: 84/255, green: 77/255, blue: 190/255, alpha: 1),
        12345: UIColor (red: 194/255, green: 79/255, blue: 73/255, alpha: 1)

    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse){
        locationManager.requestWhenInUseAuthorization()
        
        }
        locationManager.startRangingBeacons(in: region)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        let knowBeacons = beacons.filter {$0.proximity != CLProximity.unknown}
        if (knowBeacons.count > 0) {
            let closestBeacon = knowBeacons[0] as CLBeacon
            self.view.backgroundColor = self.colors[closestBeacon.minor.intValue]
        }
    }

}


