//
//  item.swift
//  BearTour
//
//  Created by sina HDalir on 12/1/19.
//  Copyright © 2019 Dalirooo. All rights reserved.
//


import UIKit

class item: UIView {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var pinView: UIView!
    @IBOutlet weak var pinEnd: UIView!
    
    static func fromNib() -> item {
        let view = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)!.first as! item
        view.frame.size = CGSize(width: 400, height: 263)
        return view
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pinView.layer.cornerRadius = 12
        pinEnd.layer.cornerRadius = pinEnd.frame.width / 2
    }
    
    func set(name: String, detail: String?) {
        label.text = name
        distance.text = detail
        layoutIfNeeded()
    }
    
    
    
}
