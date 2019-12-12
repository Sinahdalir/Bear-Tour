//
//  DetailsViewController.swift
//  BearTour
//
//  Created by sina HDalir on 12/4/19.
//  Copyright © 2019 Dalirooo. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var details: UILabel!
    var nameToDisplay: String = ""
    var yearToDisplay : String = ""
    var detailsToDisplay : String = ""
    var imageToDisplay = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = nameToDisplay
        name.numberOfLines = 0
        year.text = "Built \(yearToDisplay)"
        details.text = """
        
        History :
        
        \(detailsToDisplay)
        """
        details.numberOfLines = 0
        year.numberOfLines = 0
        image.image = imageToDisplay
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
