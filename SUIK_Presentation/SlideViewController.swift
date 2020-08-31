//
//  SlideViewController.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/29/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit

class SlideViewController: UIViewController {
    let slide: Slide
    
    init(slide: Slide) {
        self.slide = slide
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.embed {
            VStack {
                [
                    Label.title1(slide.title),
                    Label(slide.type.rawValue),
                    Spacer(),
                    slide.imageURL.map {
                        LoadingImage(URL(string: $0))
                    }
                ]
            }
        }
    }
}
