//
//  SlideView.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/29/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit

class SlideView: UIView {
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
                    ScrollView {
                        VStack {
                            [
                                slide.imageURL.map {
                                    LoadingImage(URL(string: $0))
                                        .contentMode(.scaleAspectFit)
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
                        .frame(width: Float(UIScreen.main.bounds.width - 32))
                    }
                ]
            }
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
