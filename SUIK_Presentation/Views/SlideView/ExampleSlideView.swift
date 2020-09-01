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

class ExampleSlideView: UIView {
    let slide: Slide
    
    var pointsView: UIView {
        let stack = VStack {
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
            HStack(distribution: .fillEqually) {
                [
                    VStack {
                        [
                            Label.title1(slide.title),
                            Label(slide.type.rawValue),
                            pointsView,
                            
                        ]
                    },
                    slide.imageURL.map {
                        LoadingImage(URL(string: $0))
                            .contentMode(.scaleAspectFit)
                    }
                ]
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}