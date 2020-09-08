//
//  ViewController.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 9/1/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import UDLoader
import Later
import Object
/*
 https://jsonplaceholder.typicode.com/todos/1
 {
 "userId": 1,
 "id": 1,
 "title": "delectus aut autem",
 "completed": false
 }
 */
struct MockData: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

class ViewController: UIViewController {
    
    var mockDataView = UIView.later { later in
        // Fetch Data
        later.fetch(url: URL(string: "https://jsonplaceholder.typicode.com/todos/3")!)
            // Store Values in an Object
            .map { (data, response, error) in
                Object(data).configure {
                    $0.add(variable: "response", value: response as Any)
                    $0.add(variable: "error", value: error as Any)
                }
        }
            // Save Data
            .flatMap { object in
                object.value(decodedAs: MockData.self)
                    .save(withKey: "mock_03")
        }
            // Load Data
            .flatMap { _ in
                MockData.load(withKey: "mock_03")
        }
            // Present UI
            .flatMap { data in
                later.main {
                    Label("Data: \(data.title)").number(ofLines: 100)
                }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Navigate.shared
            .configure(controller: navigationController)
            .setLeft(barButton: BarButton {
                Button("Load") { [weak self] in
                    self?.view.embed {
                        VScroll {
                            VStack {
                                (1 ... 100).map { _ in
                                    PresentationView()
                                        .frame(height: Float.random(in:  120 ... 600))
                                        .configure { $0.updateSlide(index: 0) }
                                }
                            }
                        }
                    }
                }
            })
            .setRight(barButton: BarButton {
                Button("Clear") { [weak self] in
                    Later.main {
                        self?.view.clear()
                    }
                }
            })
    }
}
