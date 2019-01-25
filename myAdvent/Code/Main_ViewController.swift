//
//  Main_ViewController.swift
//  myAdvent
//
//  Created by Alexander Meinecke on 19.10.18.
//  Copyright © 2018 Alexander Meinecke. All rights reserved.
//

import UIKit

class Main_ViewController: UIViewController {
    
    //Interface
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var open: UIButton!
    @IBOutlet weak var openOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        outputLbl()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func fail(_ sender: Any) {
        hapticCheck()
        buttonCheck()
        
        openDoor()
        
    }
    
}
