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

class IntroSlideView: UIView, SlideView {
    let slide: Slide
    
    init(slide: Slide) {
        self.slide = slide
        
        super.init(frame: .zero)
        
        embed {
            VStack {
                [
                    slide.imageURL.map {
                        UIView.load(imageURL: URL(string: $0))
                    },
                    
                    Spacer(),
                    VStack {
                        [
                            Label.title1(slide.title),
                            Label(slide.type.rawValue)
                        ]
                    }
                .frame(height: 60)
                ]
            }
//            .navigateSetRight(barButton: BarButton {
//                HStack(withSpacing: 16) {
//                    [
//                        Button("Alert") {
//                            Navigate.shared.alert(title: "Alert!", message: "3 seconds...", secondsToPersist: 3)
//                        },
//                        Button("Go") {
//                            Navigate.shared.go(UIViewController {
//                                UIView(backgroundColor: .white) {
//                                    Label("Hello World")
//                                }
//                            }, style: .push)
//                        }
//                    ]
//                }
//            })
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
