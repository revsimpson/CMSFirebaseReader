//
//  UIImageViewExtension.swift
//  CMSFirebaseReader
//
//  Created by Richard Simpson on 23/04/2019.
//  Copyright © 2019 Richard Simpson. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
