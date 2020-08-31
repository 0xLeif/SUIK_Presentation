//
//  Slide.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/29/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import Foundation

enum SlideType: String, Codable {
    case intro
    case detail
    case example
    case closure
    case end
}

struct Point: Codable {
    let title: String
    let text: String
    let subPoints: [Point]
}

struct Slide: Codable {
    let title: String
    let type: SlideType
    let points: [Point]
    let imageURL: String?
}

let presentation: [Slide] = [
    Slide(title: "Intro to SwiftUIKit", type: .intro, points: [], imageURL: "https://github.com/0xLeif/SwiftUIKit/blob/master/assets/SwiftUIKit_logo_v1.png?raw=true"),
    Slide(title: "Detail View", type: .detail, points: [], imageURL: nil),
    Slide(title: "Example View", type: .example, points: [], imageURL: nil),
    Slide(title: "Closure to Detail/ Example", type: .closure, points: [], imageURL: nil),
    Slide(title: "End of SUIK", type: .end, points: [], imageURL: nil)
]
