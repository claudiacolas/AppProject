//
//  AssetsColor.swift
//  DelAalque
//
//  Created by Anxi on 6/9/23.
//

import UIKit

enum AssetsColor {
   case blue
   case lightBlue
   case pink
   case lightPink
   case orange
   case lightOrange
   case purple
   case lightPurple
}

extension UIColor {

    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .blue:
            return UIColor(named: "Blue")
        case .lightBlue:
            return UIColor(named: "LightBlue")
        case .pink:
            return UIColor(named: "Pink")
        case .lightPink:
            return UIColor(named: "LightPink")
        case .orange:
            return UIColor(named: "Orange")
        case .lightOrange:
            return UIColor(named: "LightOrange")
        case .purple:
            return UIColor(named: "Purple")
        case .lightPurple:
            return UIColor(named: "LightPurple")
        }
    }
}
