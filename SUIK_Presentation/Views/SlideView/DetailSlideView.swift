//
//  SlideView.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/29/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import Later

class DetailSlideView: UIView, SlideView {
    let slide: Slide
    
    init(slide: Slide) {
        self.slide = slide
        
        super.init(frame: .zero)
        
        embed {
            VStack {
                [
                    VStack {
                        [
                            Label.title1(slide.title),
                            Label(slide.type.rawValue)
                        ]
                    },
                    ScrollableSlidePointsView(slide: slide, withView: slide.imageURL.map {
                        LoadingImage(URL(string: $0))
                            .contentMode(.scaleAspectFit)
                            .frame(height: 256)
                    })
                ]
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
