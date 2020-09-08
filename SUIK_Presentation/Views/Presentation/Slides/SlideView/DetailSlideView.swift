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
                    VScroll {
                        VStack {
                            [
                                slide.imageURL.map { url in
                                    UIView.load(imageURL: URL(string: url))
                                        .frame(height: 256)
                                }
                                ]
                                +
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
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
