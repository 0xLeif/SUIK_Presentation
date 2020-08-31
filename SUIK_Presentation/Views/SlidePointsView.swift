//
//  SlidePointsView.swift
//  SUIK_Presentation
//
//  Created by CRi on 8/31/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit

class SlidePointsView: UIView {

   let point: Point
    
    var subPoints: UIView {
        guard point.subPoints.isEmpty else {
            return HStack {
                [
                    Spacer(width: 32)
                ]
                +
                point.subPoints.map { SlidePointsView(point: $0) }
            }
        }
        
        return Spacer()
    }
    
    init(point: Point) {
        self.point = point
        
        super.init(frame: .zero)
        
        embed {
            VStack {
                [
                    
                    HStack(withSpacing: 8) {
                        [
                            Label("*"),
                            Label(point.title),
                            Spacer()
                        ]
                    },
                    
                    Label(point.text)
                    .number(ofLines: 5),
                    
                   subPoints
                ]
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
