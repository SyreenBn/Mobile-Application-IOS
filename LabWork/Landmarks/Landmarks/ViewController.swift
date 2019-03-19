//
//  ViewController.swift
//  Landmarks
//
//  Created by Syreen Banabilah on 3/19/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    let regionRadius: CLLocationDistance = 1000 //1000 meters or 1 kilometer
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion (center: location.coordinate, latitudinalMeters:
            regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location to RMU
        let initialLocation = CLLocation(latitude: 40.520094, longitude: -80.214068)
        centerMapOnLocation(location: initialLocation)
        //Show landmark on map
        let landmark = Landmark(title: "Wheatley Center", subtitle: "Home of the RMU CIS Department", coordinate: CLLocationCoordinate2D(latitude: 40.519076, longitude: -80.206979))
        let landmark1 = Landmark(title: "Hale Center", subtitle: "My Security Class is here", coordinate: CLLocationCoordinate2D(latitude: 40.521028, longitude: -80.208604))
        mapView.addAnnotations([landmark, landmark1])

        // Do any additional setup after loading the view, typically from a nib.
    }
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? Landmark {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as?
        MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
            }
            return view }
        return nil }



}

