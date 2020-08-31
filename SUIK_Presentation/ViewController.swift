//
//  ViewController.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/29/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import Later

class ViewController: UIViewController {
    var contractView: ContractView<UIView, Int>?
    var currentIndex: Int {
        contractView?.contract?.value ?? 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contractView = ContractView(view: UIView()) { contractView in
            Contract(initialValue: 0)
                .onChange { (value) in
                    guard let value = value,
                        (0 ..< presentation.count) ~= value else {
                            return
                    }
                    Later.main {
                        contractView.clear().embed {
                            SlideView(slide: presentation[value])
                        }
                    }
            }
        }
        
        view.embed(withPadding: 8) {
            SafeAreaView {
                VStack {
                    [
                        contractView,
                        HStack {
                            [
                                Button("Prev Slide") { [weak self] in
                                    self?.updateSlide(index: (self?.currentIndex ?? 0) - 1)
                                },
                                Spacer(),
                                Button("Next Slide") { [weak self] in
                                    self?.updateSlide(index: (self?.currentIndex ?? 0) + 1)
                                }
                            ]
                        }
                    ]
                }
            }
        }
        .navigateSet(title: "SwiftUIKit")
    }
    
    func updateSlide(index: Int) {
        guard (0 ..< presentation.count) ~= index else {
            return
        }
        
        self.contractView?.contract?.value? = index
    }
}
