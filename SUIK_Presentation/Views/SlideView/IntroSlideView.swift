//
//  IntroSlideView.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/31/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import Later

class IntroSlideView: UIView {
    let slide: Slide
    
    var imageView: UIView {
        VStack {
            [
                slide.imageURL.map {
                    LoadingImage(URL(string: $0))
                        .contentMode(.scaleAspectFit)
                },
                
                Spacer()
            ]
        }
    }
    
    init(slide: Slide) {
        self.slide = slide
        
        super.init(frame: .zero)
        
        embed {
            VStack {
                [
                    imageView,
                    VStack {
                        [
                            Label.title1(slide.title),
                            Label(slide.type.rawValue)
                        ]
                    }
                ]
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
