//
//  ScrollableSlidePointsView.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/31/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit

class ScrollableSlidePointsView: UIView {
    
    init(slide: Slide, withView view: UIView? = nil) {
        super.init(frame: .zero)
        
        let stack = VStack {
            [
                view
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
        
        embed {
            scrollView
            
        }
        .configure { parentView in
            NSLayoutConstraint.activate([
                stack.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
                stack.trailingAnchor.constraint(equalTo: parentView.trailingAnchor)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
