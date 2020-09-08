//
//  LoadingImage+.swift
//  SUIK_Presentation
//
//  Created by CRi on 9/7/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit
import Later

extension UIView {
    static func load(imageURL url: URL?) -> UIView {
        UIView.later { later in
            later
                .fetch(url: url!)
                .map { (data, response, error) in
                    UIImage(data: data!)!
            }
            .flatMap { image in
                later.main {
                    Image(image)
                        .contentMode(.scaleAspectFit)
                }
            }
        }
    }
}
