//
//  ViewController.swift
//  BearTour
//
//  Created by sina HDalir on 12/1/19.
//  Copyright © 2019 Dalirooo. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit
import ARCoreLocation
import CoreLocation
class ViewController: UIViewController, ARSKViewDelegate {
    var landmarker: ARLandmarker!
    var  markView = item.fromNib()
    var lastLocation = CLLocation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarker = ARLandmarker(view: ARSKView(), scene: InteractiveScene(), locationManager: CLLocationManager())
        landmarker.view.frame = self.view.bounds
        landmarker.scene.size = self.view.bounds.size
        self.view.addSubview(landmarker.view)
    
        landmarker.delegate = self
        landmarker.maximumVisibleDistance = 500 // Only show landmarks within 100m from user.
        
        // The landmarker can scale views so that closer ones appear larger than further ones. This scaling is linear
        // from 0 to `maxViewScaleDistance`.
        // For example, with `minViewScale` at `0.5` and `maxViewScaleDistance` at `1000`, a landmark 500 meters away
        // appears at a scale of `0.75`. A landmark 1000 meters or more away appears at a scale of `0.5`. A landmark
        // 0 meters away appears full scale (`1.0`).
        landmarker.minViewScale = 0.5 // Shrink distant landmark views to half size
        landmarker.maxViewScaleDistance = 100 // Show landmarks 75m or further at the smallest size
        
        landmarker.worldRecenteringThreshold = 30 // Recalculate the landmarks whenever the user moves 30 meters.
        landmarker.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation // You'll usually want the best accuracy you can get.
        
        // Show all the landmarks, even when they are overlapping. Another common option is to show just the nearest
        // ones (`.showNearest`). If landmark views overlap, `.showNearest` will hide the landmarks that are further
        // away.
        landmarker.overlappingLandmarksStrategy = .showNearest
        
        // Set the view's delegate
        /*sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        //Load the SKScene from 'Scene.sks'
         
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }*/
        addAllHalls()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        landmarker.view.frame = view.bounds
        landmarker.scene.size = view.bounds.size
    }
    
    private func format(distance: CLLocationDistance) -> String {
        return String(format: "%.2f km away", distance / 1000)
    }
    
    private func addAllHalls() {
        let user = landmarker.locationManager.location!
            //let markView = item.fromNib()
        
            var location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869510, longitude: -122.258778), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
            markView.set(name: "Sproul Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year: 1000)
        
            landmarker.addLandmark(view: markView, at: location, completion: nil)
        
        
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869267, longitude: -122.259596), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "ASUC Student Union", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year : 1000)
            landmarker.addLandmark(view: markView, at: location, completion: nil)
            
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875617, longitude: -122.259259), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Etcheverry Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year: 1964)
            landmarker.addLandmark(userInfo: ["name": "Etcheverry Hall", "details" : "The first UC-built building on the north side of Hearst Ave., it was named for Bernard Etcheverry, professor of drainage and irrigation and chairman of the department for nearly three decades. It once held a functioning nuclear reactor in its basement and a research wind tunnel, both now dismantled."], view: markView, at: location, completion: nil)
        
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.876091, longitude:  -122.258822), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Jacobs Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year : 2015)
            landmarker.addLandmark(userInfo: ["name": "Jacobs Hall", "details" : "Jacobs Hall, hub of the interdisciplinary Jacobs Institute for Design Innovation, contains 24,000 square feet of design studios and maker labs with access to the latest equipment for rapid prototyping and fabrication."], view: markView, at: location, completion: nil)
        
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875581, longitude:   -122.258683), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Soda Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year: 1994)
            landmarker.addLandmark(userInfo: ["name": "Soda Hall", "details" : "Funded by the Y & H Soda Foundation and named in honor of Y. Charles and Helen Soda as a tribute to their commitment to education in the Bay Area. With classrooms, labs, and offices, Soda Hall was designed with its Computer Science residents in mind: its open alcoves encourage informal interactions among students and faculty, and its labs and offices are grouped to foster a team approach to computing innovation. In Soda Hall, \"the building is the computer\" with advanced networking, wireless capabilities, and access to computer clusters for shared computing power, storage, and services - all unique when the building opened."], view: markView, at: location, completion: nil)
        
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875581, longitude:   -122.258683), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Goldman School", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year : 1893)
            landmarker.addLandmark(userInfo: ["name": "Goldman School", "details" : """
                This Tudor-style mansion at 2607 Hearst began life as the Beta Theta fraternity chapter house, and was one of the first buildings in the heavily wooded residential neighborhood on the north border of campus. Among early chapter members were noted architects Charles Keeler (inspiration for Berkeley's famous Hillside Club), John Baker Jr. and Arthur Brown Jr., who singly or together designed Berkeley's City Hall, San Francisco's City Hall and Opera House, and two future expansions for the fraternity chapter house. (Brown also served as the University of California's supervising architect.)
                The main 1893 structure was designed by English-trained Ernest Coxhead. According to an 1894 issue of the Berkeley Weekly Herald, it contained \"eight bedrooms, kitchen, dining room, reception room, library and a large chapter hall, which can be used for dancing.\"
                After a number of additions to the building in the first third of the 20th century, the Betas moved out in 1966 when the property was purchased by the university. The new School of Public Policy moved in in 1969, and in 1997 was named in honor of Richard and Rhoda Goldman, generous Berkeley alumni. An annex fronting LeRoy Ave. was completed in 2002.
                """], view: markView, at: location, completion: nil)
        
        
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875036, longitude:  -122.257635), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Cory Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year : 1950)
            landmarker.addLandmark(userInfo: ["name": "Cory Hall", "details" : "Named for Clarence L. Cory, dean of the College of Mechanics and a faculty member for almost 40 years, Cory had a fifth floor added in 1985, the exterior of which features a computer chip-inspired design motif. The building houses a state-of-the-art electronic micro-fabrication facility and labs devoted to integrated circuits, lasers, and robotics. Cory has the dubious distinction of being the only site bombed twice by \"Unabomber\" Theodore Kaczynski in the 1980s."], view: markView, at: location, completion: nil)
        
            //My House
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.864385, longitude:  -122.255322), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "My House", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year : 2019)
            landmarker.addLandmark(userInfo: ["name": "My House", "details" : "Named for Clarence L. Cory, dean of the College of Mechanics and a faculty member for almost 40 years, Cory had a fifth floor added in 1985, the exterior of which features a computer chip-inspired design motif. The building houses a state-of-the-art electronic micro-fabrication facility and labs devoted to integrated circuits, lasers, and robotics. Cory has the dubious distinction of being the only site bombed twice by \"Unabomber\" Theodore Kaczynski in the 1980s."], view: markView, at: location, completion: nil)
        
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.868557, longitude:  -122.250301), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
         markView.set(name: "Alpha Tau Omege", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year : 2019)
             landmarker.addLandmark(userInfo: ["name": "Alpha Tau Omege", "details" : "Ru Ra Rega"], view: markView, at: location, completion: nil)
        
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869705, longitude:  -122.251387), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
                markView.set(name: "International House", detail: String(format: "%.2f km away", user.distance(from: location) / 1000), year : 2019)
                    landmarker.addLandmark(userInfo: ["name": "International House", "details" : "Hotties"], view: markView, at: location, completion: nil)
               
       
        
        
    }
    
    // MARK: - ARSKViewDelegate
    
  
}


extension ViewController: ARLandmarkerDelegate {
    func updateWorldOriginBeingCalled() {
        
    }
    
    func landmarkDisplayer(_ landmarkDisplayer: ARLandmarker, didTap landmark: ARLandmark) {
        var name = "error"
        var details = "error"
        if let temp = landmark.userInfo["name"] as? String {
            name = temp
        }
        if let temp = landmark.userInfo["details"] as? String {
            details = temp
        }
        
        let alert = UIAlertController(title: name, message: details, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func landmarkDisplayer(_ landmarkDisplayer: ARLandmarker, willUpdate landmark: ARLandmark, for location: CLLocation) -> UIView? {
        return nil
    }
    
    func landmarkDisplayer(_ landmarkDisplayer: ARLandmarker, didFailWithError error: Error) {
        print("Failed! Error: \(error)")
    }
}



