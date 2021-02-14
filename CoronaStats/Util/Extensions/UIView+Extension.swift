//
//  UIView+Extension.swift
//  CoronaStats
//
//  Created by n3deep on 13.02.2021.
//

import Foundation
import UIKit

extension UIView {
    
    func dropShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 2, height: 4)
        self.layer.shadowRadius = 5
    }
}
