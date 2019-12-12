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
        landmarker.maximumVisibleDistance = 150 // Only show landmarks within 100m from user.
        
        // The landmarker can scale views so that closer ones appear larger than further ones. This scaling is linear
        // from 0 to `maxViewScaleDistance`.
        // For example, with `minViewScale` at `0.5` and `maxViewScaleDistance` at `1000`, a landmark 500 meters away
        // appears at a scale of `0.75`. A landmark 1000 meters or more away appears at a scale of `0.5`. A landmark
        // 0 meters away appears full scale (`1.0`).
        landmarker.minViewScale = 0.5 // Shrink distant landmark views to half size
        landmarker.maxViewScaleDistance = 100 // Show landmarks 75m or further at the smallest size
        
        landmarker.worldRecenteringThreshold = 40 // Recalculate the landmarks whenever the user moves 30 meters.
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
        
        //Sproul Hall
        var location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869510, longitude: -122.258778), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Sproul Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Sproul Hall", "details" : "Robert Gordon Sproul graduated from Berkeley in 1913, then worked his way up at his alma mater from cashier to president (1930-58). Sproul was the first Berkeley alumnus and the first native Californian to serve as university president. The neoclassical building, designed by Arthur Brown, Jr., housed the offices of the chancellor and other top administrators until the 1960s, when they were repeatedly occupied by students from the Free Speech Movement. The chancellor subsequently decamped for more-secure California Hall.", "year" : "1941" , "image" : UIImage(named:"sproulhall")!], view: markView, at: location, completion: nil)
        
        
        //ASUC Student Union
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869267, longitude: -122.259596), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "ASUC Student Union", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "ASUC Student Union", "details" : "The Student Union, owned by the ASUC Auxiliary, was constructed with funds gained from the sale of the Cal sports teams to the university in 1959. It contains an information center, multicultural center, lounges, a bookstore, restaurants and a pub, an art studio and computer lab. The orignal building was designed by Vernon DeMars, professor of architecture.", "year" : "2015", "image" : UIImage(named:"mlk")!], view: markView, at: location, completion: nil)
            
        
        //Etcheverry Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875617, longitude: -122.259259), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Etcheverry Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Etcheverry Hall", "details" : "The first UC-built building on the north side of Hearst Ave., it was named for Bernard Etcheverry, professor of drainage and irrigation and chairman of the department for nearly three decades. It once held a functioning nuclear reactor in its basement and a research wind tunnel, both now dismantled.", "year" : "1964" , "image" : UIImage(named:"etcheverry")!], view: markView, at: location, completion: nil)
        
        
        //Jacobs Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.876091, longitude:  -122.258822), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Jacobs Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Jacobs Hall", "details" : "Jacobs Hall, hub of the interdisciplinary Jacobs Institute for Design Innovation, contains 24,000 square feet of design studios and maker labs with access to the latest equipment for rapid prototyping and fabrication.", "year" : "2015" , "image" : UIImage(named:"jacobs")!], view: markView, at: location, completion: nil)
        
        //Soda Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875647, longitude:   -122.258626), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Soda Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Soda Hall", "details" : "Funded by the Y & H Soda Foundation and named in honor of Y. Charles and Helen Soda as a tribute to their commitment to education in the Bay Area. With classrooms, labs, and offices, Soda Hall was designed with its Computer Science residents in mind: its open alcoves encourage informal interactions among students and faculty, and its labs and offices are grouped to foster a team approach to computing innovation. In Soda Hall, \"the building is the computer\" with advanced networking, wireless capabilities, and access to computer clusters for shared computing power, storage, and services - all unique when the building opened.", "year" : "1994", "image" : UIImage(named: "soda")!], view: markView, at: location, completion: nil)
        
        
        //Goldman School
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875680, longitude: -122.257858), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Goldman School", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Goldman School", "details" : """
                This Tudor-style mansion at 2607 Hearst began life as the Beta Theta fraternity chapter house, and was one of the first buildings in the heavily wooded residential neighborhood on the north border of campus. Among early chapter members were noted architects Charles Keeler (inspiration for Berkeley's famous Hillside Club), John Baker Jr. and Arthur Brown Jr., who singly or together designed Berkeley's City Hall, San Francisco's City Hall and Opera House, and two future expansions for the fraternity chapter house. (Brown also served as the University of California's supervising architect.)
                The main 1893 structure was designed by English-trained Ernest Coxhead. According to an 1894 issue of the Berkeley Weekly Herald, it contained \"eight bedrooms, kitchen, dining room, reception room, library and a large chapter hall, which can be used for dancing.\"
                After a number of additions to the building in the first third of the 20th century, the Betas moved out in 1966 when the property was purchased by the university. The new School of Public Policy moved in in 1969, and in 1997 was named in honor of Richard and Rhoda Goldman, generous Berkeley alumni. An annex fronting LeRoy Ave. was completed in 2002.
                """, "year" : "1893", "image" : UIImage(named: "goldman")!], view: markView, at: location, completion: nil)
        
        
        //Cory Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875036, longitude:  -122.257635), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Cory Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Cory Hall", "details" : "Named for Clarence L. Cory, dean of the College of Mechanics and a faculty member for almost 40 years, Cory had a fifth floor added in 1985, the exterior of which features a computer chip-inspired design motif. The building houses a state-of-the-art electronic micro-fabrication facility and labs devoted to integrated circuits, lasers, and robotics. Cory has the dubious distinction of being the only site bombed twice by \"Unabomber\" Theodore Kaczynski in the 1980s.", "year" : "1950",  "image" : UIImage(named: "cory")!], view: markView, at: location, completion: nil)
        
            //My House
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.864385, longitude:  -122.255322), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "My House", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "My House", "details" : "Lovely warm house. ALL GUEST ARE WELCOME Named for Clarence L. Cory, dean of the College of Mechanics and a faculty member for almost 40 years, Cory had a fifth floor added in 1985, the exterior of which features a computer chip-inspired design motif. The building houses a state-of-the-art electronic micro-fabrication facility and labs devoted to integrated circuits, lasers, and robotics. Cory has the dubious distinction of being the only site bombed twice by \"Unabomber\" Theodore Kaczynski in the 1980s.", "year" : "2000", "image" : UIImage(named:"myhouse")!], view: markView, at: location, completion: nil)
        
        //My Neighbor
            location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.864377, longitude:  -122.254859), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "My Neighbor's HOuse", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "My Neighbor's HOuse", "details" : "The Graduate Theological Union Library is not part of UC Berkeley. However, Berkeley has a library borrowing agreement with GTU.", "year" : "1990", "image" : UIImage(named:"soda")!], view: markView, at: location, completion: nil)
        
        
        //Graduate Theological Union
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875464, longitude:  -122.261850), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
         markView.set(name: "Graduate Theological Union", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
             landmarker.addLandmark(userInfo: ["name": "Graduate Theological Union", "details" : "The Graduate Theological Union Library is not part of UC Berkeley. However, Berkeley has a library borrowing agreement with GTU.", "year" : "Unknown", "image" : UIImage(named:"gtu")!], view: markView, at: location, completion: nil)
        
        //ATO
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.868557, longitude:  -122.250301), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Alpha Tau Omege", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
            landmarker.addLandmark(userInfo: ["name": "Alpha Tau Omege", "details" : "Ru Ra Rega", "year" : "2004",  "image" : UIImage(named:"ato")!], view: markView, at: location, completion: nil)
        
        //
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.875288, longitude:  -122.260622), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
         markView.set(name: "Investigative Reporting Program", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
             landmarker.addLandmark(userInfo: ["name": "Investigative Reporting Program", "details" : "Located at 2481 Hearst Ave. ", "year" : "Unknown",  "image" : UIImage(named:"IPR")!], view: markView, at: location, completion: nil)
        
        //Barker Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873920, longitude:  -122.265429), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Barker Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
            landmarker.addLandmark(userInfo: ["name": "Barker Hall", "details" : "Designed by William Wurster and named for Horace Albert Barker, a biochemist specializing in metabolism.", "year" : "1964" ,  "image" : UIImage(named:"barker")!], view: markView, at: location, completion: nil)
        
        //Koshland HAll
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873958, longitude:  -122.264866), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Koshland Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
            landmarker.addLandmark(userInfo: ["name": "Koshland Hall", "details" : "Named for Daniel Koshland, a Berkeley alumnus, biochemistry professor, and longtime editor of Science magazine.", "year" : "1990" ,  "image" : UIImage(named:"koshland")!], view: markView, at: location, completion: nil)
        
        //Li Ka Shing Center
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873077, longitude:  -122.265236), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Li Ka Shing Center", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
            landmarker.addLandmark(userInfo: ["name": "Li Ka Shing Center", "details" : "The Li Ka-shing Center for Biomedical and Health Sciences will make a huge contribution to the advancement of medical research. The facility houses computer scientists, biologists, physicists, engineers, chemists and mathematicians under one roof and enables a collaborative medical approach towards four key medical issues: stem cell research, infectious diseases including HIV and dengue fever, cancer, and neurosciences including Alzheimer’s disease. Several Nobel prize laureates also work in the center.", "year" : "2011" ,  "image" : UIImage(named:"likashing")!], view: markView, at: location, completion: nil)
        
        
        //Morgan Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873237, longitude: -122.264243), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Morgan Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Morgan Hall", "details" : "Named for Agnes Fay Morgan, professor of nutrition from 1915-54.", "year" : "1953" ,  "image" : UIImage(named:"morgan")!], view: markView, at: location, completion: nil)
       
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.872665, longitude: -122.264366), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Mulford Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Mulford Hall", "details" : "Named for Water Mulford, first dean of the School of Forestry, 1914-47. Much of the interior is wood-paneled or covered by planks from native California trees (most donated by lumber companies) or foreign species (most obtained from the 1915 Panama Pacific Exposition).", "year" : "1948" ,  "image" : UIImage(named:"mulford")!], view: markView, at: location, completion: nil)
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873300, longitude: -122.263454), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Hilgard Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Hilgard Hall", "details" : "Designed by John Galen Howard, this was one of the first campus buildings to acknowledge the city of Berkeley (by attempting to face both inward and outward at the same time). It was named for Eugene Hilgard, an agriculture professor who founded the University Agricultural Experimental Station. Added to the National Register of Historic Places in 1982.", "year" : "1917" ,  "image" : UIImage(named:"hilgard")!], view: markView, at: location, completion: nil)
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873469, longitude: -122.264623), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Genetics and Plant Biology", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Genetics and Plant Biology", "details" : "One of four circa-1990 building projects aimed at revitalizing the biological sciences on the Berkeley campus, this building houses classrooms, laboratories, and office space.", "year" : "1990" ,  "image" : UIImage(named:"genetics")!], view: markView, at: location, completion: nil)
        
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873740, longitude: -122.262998), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Henry H. Wheeler Brain Imaging Center", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Henry H. Wheeler Brain Imaging Center", "details" : "The Henry H. \"Sam\" Wheeler, Jr. Brain Imaging Center (BIC) houses one of the most powerful human research functional Magnetic Resonance Imaging (fMRI) system in the United States. The 4 tesla magnet provides an opportunity for research collaboration in functional neuroimaging among diverse fields. Data are analyzed at the Judy & John Webb Neuroimaging Computational Facility also housed on the Berkeley campus.", "year" : "1998" ,  "image" : UIImage(named:"wheelerBIC")!], view: markView, at: location, completion: nil)
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873456, longitude: -122.262285), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Giannini Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Giannini Hall", "details" : "Designed by William C. Hays, this building was named for benefactor Amadeo Peter Giannini, founder of the Bank of Italy (which eventually became the Bank of America). The light-splashed entry hall and grand split staircase are filled with Art Deco details. Added to the National Register of Historic Places in 1982.", "year" : "1930" ,  "image" : UIImage(named:"giannini")!], view: markView, at: location, completion: nil)
        
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873456, longitude: -122.262285), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Haviland Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Haviland Hall", "details" : "Designed by John Galen Howard and named in honor of San Francisco banker J.T.H. Haviland, whose wife donated the funds for the building. Added to the National Register of Historic Places in 1982.", "year" : "1924" ,  "image" : UIImage(named:"haviland")!], view: markView, at: location, completion: nil)
        
        
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.873561, longitude: -122.260284), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Starr East Asian Library", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        landmarker.addLandmark(userInfo: ["name": "Starr East Asian Library", "details" : "Berkeley’s vast collection of East Asian manuscripts and artifacts -- assembled over the past century -- is housed in this library, the first freestanding structure at a U.S. university erected solely for East Asian collections. The library is home to more than 900,000 volumes, primarily in Chinese, Japanese, and Korean, plus thousands of manuscripts, rubbings, and the largest and most valuable collection of historic Japanese maps outside of Japan. It is also the largest U.S. academic repository of materials on the People's Republic of China. It is named for the late Cornelius Vander Starr, an insurance pioneer with a deep interest in Asia and a major donor to the building fund for the library.", "year" : "2008" ,  "image" : UIImage(named:"starr")!], view: markView, at: location, completion: nil)
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.874167, longitude: -122.259726), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "McCone Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "McCone Hall", "details" : "Designed by John Warnecke, McCone Hall houses several academic departments in the earth sciences, as well as the Berkeley Seismological Laboratory, one of the world's foremost centers for the study of earthquakes, and the Earth Sciences and Map Library. It is named for alumnus and former CIA director John McCone.", "year" : "1961" ,  "image" : UIImage(named:"mccone")!], view: markView, at: location, completion: nil)
        
        
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869733, longitude: -122.251660), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "International House", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "International House", "details" : "Home to nearly 600 international and U.S. students, I-House aims to foster intercultural respect and understanding by giving students and scholars from many lands a place to live and learn together. Despite considerable community resistance to the idea of mixing different nationalities, races, and genders under one roof, it opened in the midst of Berkeley's fraternity and sorority row in 1930, the first coeducational student residence west of the Mississippi. The building's Moorish-influenced design is by George Kelham.", "year" : "1930", "image" : UIImage(named: "ihouse")!], view: markView, at: location, completion: nil)
        
        
        //Hearst Memorial Gymnasium
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869441, longitude: -122.256880), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Hearst Memorial Gymnasium", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Hearst Memorial Gymnasium", "details" : "Campus architect John Galen Howard was away in Europe when the UC Regents awarded the design of the gymnasium to celebrated local architects Bernard Maybeck and Julia Morgan. It was named for campus benefactor and UC Regent Phoebe Apperson Hearst and added to the National Register of Historic Places in 1982. In addition to large and small gymnasiums and outdoor swimming pools, the building once contained an indoor rifle range.", "year" : "1927", "image" : UIImage(named: "hearstgym")!], view: markView, at: location, completion: nil)
        
        //Kroeber Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869788, longitude: -122.255233), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Kroeber Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Kroeber Hall", "details" : "Named for anthropology professor Alfred Kroeber, it houses the Phoebe Hearst Museum of Anthropology and the Worth Ryder Art Gallery, in addition to classroom and office space.", "year" : "1959", "image" : UIImage(named: "kroeber")!], view: markView, at: location, completion: nil)
        
        
        // Hearst Field Annex
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869225, longitude: -122.257717), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Hearst Field Annex", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Hearst Field Annex", "details" : "This complex of metal-frame buildings hosts a changing array of departments and service units displaced by construction or space shortages elsewhere on campus.", "year" : "1999", "image" : UIImage(named: "hearstAnnex")!], view: markView, at: location, completion: nil)
        
        // Zellerbach Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869102, longitude: -122.261011), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Zellerbach Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Zellerbach Hall", "details" : "The primary fine arts performance space on campus is named for Isadore and Jennie Zellerbach, who contributed $1 million toward its construction. The 2,100-seat main auditorium has witnessed performances by many of the world's most acclaimed orchestras, vocalists, dance companies, and speakers. There is also a 500-seat Playhouse for smaller productions.", "year" : "1968", "image" : UIImage(named: "zellerbach")!], view: markView, at: location, completion: nil)
        
        
        // Haas Pavilion
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.869377, longitude: -122.262159), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Haas Pavilion", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Haas Pavilion", "details" : "Built in 1933 as Harmon Gym; reconstructed in 1999 as Haas Pavilion, a state-of-the-art basketball arena and sports facility that preserved the intimacy, noise level, and intimidating home-court advantage of its predecessor. The 12,000-seat complex is named in honor of Walter A. Haas, Jr.", "year" : "1999", "image" : UIImage(named: "haaspav")!], view: markView, at: location, completion: nil)
        
        // Wheeler Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.871079, longitude: -122.259225), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Wheeler Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Wheeler Hall", "details" : "Named for Benjamin Ide Wheeler, university president during Berkeley's \"golden years\" from 1899-1919. The French Baroque facade includes arched doorways leading into a vaulted auditorium lobby, ionic columns across the middle floors, and a colonnade ornamented with urn-shaped lamps symbolizing, according to designer John Galen Howard, \"the light of learning.\" It was added to the National Register of Historic Places in 1982." , "year" : "1917", "image" : UIImage(named: "wheeler")!], view: markView, at: location, completion: nil)
        
        // Dwinelle Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.870461, longitude: -122.260523), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Dwinelle Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Dwinelle Hall", "details" : "With more than 300,000 square feet of office and classroom space, an infuriating room-numbering system, and a layout often likened to a maze, Dwinelle is the second largest building on campus. It is named for John W. Dwinelle, a UC regent, state assemblyman, and author of the 1868 \"Organic Act\" establishing the University of California. In the center is Ishi Court, named in honor of a Native American \"found\" by anthropologist Alfred Kroeber near Oroville, CA, in 1911 and brought to live in the UC Berkeley Museum of Anthropology." , "year" : "1952", "image" : UIImage(named: "dwinelle")!], view: markView, at: location, completion: nil)
        
        // South Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.871270, longitude: -122.258485), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "South Hall", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "South Hall", "details" : "The oldest structure on campus, and the only surviving building of the original university nucleus, South Hall was the original home of the College of Agriculture. It once had a near twin, North Hall, situated where the Bancroft Library stands today. The brick structure, designed by Scottish architect David Farquharson, is a rare and distinguished example of the Second Empire style. Over the course of its long history, South Hall has hosted the first physics lab in America (1879), the business school, a temporary museum for the state geological survey, and the persistent myth that the rooftop scene in \"Mary Poppins\" was filmed there. Added to the National Register of Historic Places in 1982." , "year" : "1873", "image" : UIImage(named: "south")!], view: markView, at: location, completion: nil)
        
        
        // Campanile (Sather Tower)
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.872049, longitude: -122.257782), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Campanile ", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Campanile ", "details" : "Popularly known as the Campanile, the 307-foot tower is named for Jane K. Sather, designed by John Galen Howard, and built at a cost of $250,000. Its nickname derives from its resemblance to St. Mark's Campanile in Venice. The 61 bells in the carillon are played three times daily, except during exams. The four clocks, the largest in California, have 17-foot hands made of Sitka spruce and numerals of bronze. Because of the consistent temperatures on its lower floors, the Campanile also houses many of the paleontology museum's fossils. Added to the National Register of Historic Places in 1982. The Campanile's observation deck is open daily." , "year" : "1914", "image" : UIImage(named: "campanile")!], view: markView, at: location, completion: nil)
        
        
        // Go Bears Easter Egg
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.872049, longitude: -122.257782), altitude: user.altitude + 90, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Go Bears! ", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "GoBears", "details" : "GO BEARSSSSSS!!!" , "year" : "50", "image" : UIImage(named: "gobears")!], view: markView, at: location, completion: nil)
        
        //Durant Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.871177, longitude: -122.260116), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Durant Hall ", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Durant Hall ", "details" : "Originally the Boalt Memorial Hall of Law, it was renamed for Henry Durant, the university's first president in 1870-72, after the law school moved to the southeast side of campus in 1951. Designed by John Galen Howard. Added to the National Register of Historic Places in 1982." , "year" : "1911", "image" : UIImage(named: "durant")!], view: markView, at: location, completion: nil)
        
        
        //Doe Memorial Library
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.872104, longitude: -122.259429), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Doe Memorial Library ", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Doe Memorial Library ", "details" : "Named for Charles Franklin Doe, who came from Maine in 1857 as a schoolteacher and made his fortune in California. He left a quarter of his estate to the university for construction of a new library. The Beaux Arts building, which features the magnificently restored North Reading Room and the cozy Morrison Library, was the centerpiece of architect John Galen Howard's classical campus ensemble. The placement of Athena, the Greek goddess of wisdom, over the main entrance reflects Berkeley's aspiration to become the \"Athens of the West.\" The building was placed on the National Register of Historic Places in 1982. A four-story underground addition, the Gardner Stacks, opened in 1995 to provide more space for the library's holdings." , "year" : "1955", "image" : UIImage(named: "doe")!], view: markView, at: location, completion: nil)
        
        //Moses Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.870931, longitude: -122.257960), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Moses Hall ", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Moses Hall ", "details" : "Named for Bernard Moses, history professor from 1876-1930. The George Kelham-designed building started life as Eshleman Hall, home of the Daily Cal, before it was sold to the Regents in 1959 and renamed." , "year" : "1931", "image" : UIImage(named: "moses")!], view: markView, at: location, completion: nil)
        
    
        
        
        // Stephens Hall
        location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 37.871202, longitude: -122.257579), altitude: user.altitude + 5, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: Date())
        markView.set(name: "Stephens Hall ", detail: String(format: "%.2f km away", user.distance(from: location) / 1000))
        
        landmarker.addLandmark(userInfo: ["name": "Stephens Hall ", "details" : "The building, which formerly served as the Student Union, was designed in Collegiate Gothic style by John Galen Howard and named for Henry Morse Stephens, a professor and student adviser." , "year" : "1923", "image" : UIImage(named: "stephens")!], view: markView, at: location, completion: nil)
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let info = sender as? [String : Any?], let dest = segue.destination as? DetailsViewController {
            if let name = info["name"] as? String, let details = info["details"] as? String, let year = info["year"] as? String, let image = info["image"] as? UIImage{
                dest.nameToDisplay = name
                dest.detailsToDisplay = details
                dest.imageToDisplay = image
                dest.yearToDisplay = year
            }
        }
        
    }
    
    func playSounds() {
    
        SystemSoundID.playSound(withFilename: "GoBears.wav")
        
    }
    
    
  
}


extension ViewController: ARLandmarkerDelegate {
    func updateWorldOriginBeingCalled() {
        
    }
    
    func landmarkDisplayer(_ landmarkDisplayer: ARLandmarker, didTap landmark: ARLandmark) {
        /*var name = "error"
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
        */
        performSegue(withIdentifier: "Detail", sender: landmark.userInfo)
        if let name = landmark.userInfo["name"] as? String  {
            if name == "GoBears" {
                playSounds()
            }
        }
    }
    
    func landmarkDisplayer(_ landmarkDisplayer: ARLandmarker, willUpdate landmark: ARLandmark, for location: CLLocation) -> UIView? {
        return nil
    }
    
    func landmarkDisplayer(_ landmarkDisplayer: ARLandmarker, didFailWithError error: Error) {
        print("Failed! Error: \(error)")
    }
}



import AudioToolbox

extension SystemSoundID {
    static func playSound(withFilename filename: String) {
        var sound: SystemSoundID = 0
        if let soundURL = Bundle.main.url(forResource: filename, withExtension: nil) {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &sound)
            AudioServicesPlaySystemSound(sound)
        }
    }
}



