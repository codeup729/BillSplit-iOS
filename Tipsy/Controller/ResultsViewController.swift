//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Anitej Srivastava on 31/07/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var perPersonSplit: Float?
    var splitDetails: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(perPersonSplit ?? 0.0)
        settingsLabel.text = String(splitDetails ?? "")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
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
