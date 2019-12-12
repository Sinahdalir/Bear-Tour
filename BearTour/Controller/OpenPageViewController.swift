//
//  OpenPageViewController.swift
//  BearTour
//
//  Created by sina HDalir on 12/11/19.
//  Copyright © 2019 Dalirooo. All rights reserved.
//

import UIKit

class OpenPageViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 40
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func start(_ sender: UIButton) {
        performSegue(withIdentifier: "AR", sender: button)
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
