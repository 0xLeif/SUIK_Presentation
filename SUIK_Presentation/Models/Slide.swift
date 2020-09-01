//
//  Slide.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/29/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import Foundation
import UIKit

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

extension Slide {
    var view: SlideView {
        switch type {
        case .intro, .end:
            return IntroSlideView(slide: self)
        case .detail:
            return DetailSlideView(slide: self)
        case .example:
            return ExampleSlideView(slide: self)
        case .closure:
            return ClosureSlideView(slide: self)
        }
    }
}

let presentation: [Slide] = [
    Slide(title: "Intro to SwiftUIKit", type: .intro, points: [], imageURL: "https://github.com/0xLeif/SwiftUIKit/blob/master/assets/SwiftUIKit_logo_v1.png?raw=true"),
    Slide(title: "Detail View", type: .detail, points: [], imageURL: nil), // No Points
    Slide(title: "Detail View", type: .detail, points: [Point(title: "First Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])], imageURL: nil), // One Point
    
    Slide(title: "Detail View", type: .detail, points: [
        Point(title: "First Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: []),
        Point(title: "Second Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])
    ], imageURL: nil), // Two Points
    
    Slide(title: "Detail View", type: .detail, points: [
        Point(title: "First Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [
            Point(title: "First Sub-Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])
        ])
    ], imageURL: nil), // Sub Points
    
    Slide(title: "Detail View", type: .detail, points: [
        Point(title: "First Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [
            Point(title: "First Sub-Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [
                Point(title: "First Sub-Sub-Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])
            ])
        ]),
        Point(title: "Second Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])
    ], imageURL: nil), // Sub Sub Points
    
    Slide(title: "Detail View", type: .detail, points: [Point(title: "First Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])], imageURL: "https://github.com/0xLeif/SwiftUIKit/blob/master/assets/SwiftUIKit_logo_v1.png?raw=true"), // One Point
    
    Slide(title: "Detail View", type: .detail, points: [
        Point(title: "First Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: []),
        Point(title: "Second Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])
    ], imageURL: "https://github.com/0xLeif/SwiftUIKit/blob/master/assets/SwiftUIKit_logo_v1.png?raw=true"), // Two Points
    
    Slide(title: "Example View", type: .example, points: [
        Point(title: "First Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [
            Point(title: "First Sub-Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])
        ])
    ], imageURL: "https://github.com/0xLeif/SwiftUIKit/blob/master/assets/SwiftUIKit_logo_v1.png?raw=true"), // Sub Points
    
    Slide(title: "Example View", type: .example, points: [
        Point(title: "First Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [
            Point(title: "First Sub-Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [
                Point(title: "First Sub-Sub-Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])
            ])
        ]),
        Point(title: "Second Point", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum sit amet felis non quam lacinia dictum. Aliquam eget egestas lectus, condimentum pretium ligula. Phasellus iaculis at ante eu luctus. Suspendisse est arcu, luctus eu tellus vitae, iaculis lacinia risus. Nulla pellentesque ante id velit lacinia tristique. Aenean sit amet fringilla odio. Donec iaculis odio ut risus facilisis, sed sagittis dolor porta. Sed vel ex dictum, tempus nisi ut, viverra mauris. In porta sem et commodo suscipit. Fusce fermentum vitae ante vitae vestibulum. Pellentesque accumsan efficitur lectus id eleifend. Curabitur id varius orci. Donec vitae nisi lacus. Phasellus sodales vel ipsum sed dapibus.", subPoints: [])
    ], imageURL: "https://github.com/0xLeif/SwiftUIKit/blob/master/assets/SwiftUIKit_logo_v1.png?raw=true"), // Sub Sub Points
    
    Slide(title: "Example View", type: .example, points: [], imageURL: nil),
    Slide(title: "Closure to Detail/ Example", type: .closure, points: [], imageURL: nil),
    Slide(title: "End of SUIK", type: .end, points: [], imageURL: nil)
]
