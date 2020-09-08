//
//  ExampleSlideView.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/31/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import Later

class ExampleSlideView: UIView, SlideView {
    let slide: Slide
    
    init(slide: Slide) {
        self.slide = slide
        
        super.init(frame: .zero)
        
        embed {
            HStack(distribution: .fillEqually) {
                [
                    VStack {
                        [
                            Label.title1(slide.title),
                            Label(slide.type.rawValue),
                            VScroll {
                                VStack {
                                    slide.points.map {
                                        SlidePointsView(point: $0)
                                    }
                                    +
                                    [
                                        Spacer()
                                    ]
                                }
                            }
                        ]
                    },
                    slide.imageURL.map {
                        UIView.load(imageURL: URL(string: $0))
                    }
                ]
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
