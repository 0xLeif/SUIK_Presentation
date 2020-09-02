//
//  ViewController.swift
//  SUIK_Presentation
//
//  Created by CRi on 9/1/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Navigate.shared.configure(controller: navigationController)
        
        view.embed {
            VScroll {
                VStack {
                    (1 ... 50).map { _ in
                        PresentationView()
                            .frame(height: Float.random(in:  120 ... 600))
                    }
                }
                .debug()
            }
        }
    }
    
}
