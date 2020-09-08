//
//  PresentationView.swift
//  SUIK_Presentation
//
//  Created by Zach Eriksen on 8/29/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import Later

class PresentationView: UIView {
    deinit {
        contractView.contract?.resign()
        print(#function)
    }
    
    var contractView: ContractView<UIView, Int> = ContractView { contractView in
        Contract(initialValue: 0)
            .onChange { (value) in
                guard let value = value,
                    (0 ..< presentation.count) ~= value else {
                        return
                }
                Later.main {
                    contractView
                        .clear()
                        .embed {
                            presentation[value].view
                    }
                }
        }
    }
    
    var currentIndex: Int {
        contractView.contract?.value ?? 0
    }
    
    init() {
        super.init(frame: .zero)
        
        embed {
            SafeAreaView {
                VStack {
                    [
                        self.contractView,
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
                        .frame(height: 44)
                    ]
                }
            }
        }
        .navigateSet(title: "SwiftUIKit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateSlide(index: Int) {
        guard (0 ..< presentation.count) ~= index else {
            return
        }
        
        self.contractView.contract?.value? = index
    }
}
