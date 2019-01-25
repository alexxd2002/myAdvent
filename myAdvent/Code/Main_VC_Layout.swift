//
//  Main_VC_Layout.swift
//  myAdvent
//
//  Created by Alexander Meinecke on 19.10.18.
//  Copyright © 2018 Alexander Meinecke. All rights reserved.
//

import UIKit

extension Main_ViewController {
    /**
     Open Button Layout
    */
    func bttnLayout() {
        open.layer.cornerRadius = open.frame.height / 2
        
    }
    
    /**
     Gesamtes Layout
    */
    func layout() {
        bttnLayout()
    }
}
