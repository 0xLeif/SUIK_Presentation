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

class DetailSlideView: UIView {
    let slide: Slide
    
    var pointsView: UIView {
        let stack = VStack {
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
        
        let scrollView = ScrollView {
            stack
        }
        
        return UIView {
            scrollView
        }
        .configure { parentView in
            NSLayoutConstraint.activate([
                stack.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
                stack.trailingAnchor.constraint(equalTo: parentView.trailingAnchor)
            ])
        }
    }
    
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
                    pointsView
                ]
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
