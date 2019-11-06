//
//  ChartSupplementViewController.swift
//  TechTalksPrimer
//
//  Created by Nicholas Neuberger on 11/6/19.
//  Copyright © 2019 Nicholas Neuberger. All rights reserved.
//

import UIKit

class ChartSupplementDetailViewController: UIViewController {
    
    @IBOutlet weak var geoname: UILabel!
    @IBOutlet weak var pageNumber: UILabel!
    
    var edition:Edition?

    override func viewDidLoad() {
        super.viewDidLoad()

        geoname.text = edition?.geoname.toString()
        pageNumber.text = edition?.product.pageNumber()
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
