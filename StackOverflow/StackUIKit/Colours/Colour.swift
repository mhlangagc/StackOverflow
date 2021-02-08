//
//  Colour.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

final class Font {
    
    // Bold
    static let bold10       =  UIFont.systemFont(ofSize: 10.0, weight: .bold)
    
    //  Semibold
    static let semibold17   =  UIFont.systemFont(ofSize: 17.0, weight: .semibold)
    static let semibold10   =  UIFont.systemFont(ofSize: 10.0, weight: .semibold)
    
    //  Regular
    static let regular14    =  UIFont.systemFont(ofSize: 14.0, weight: .regular)
    static let regular13    =  UIFont.systemFont(ofSize: 13.0, weight: .regular)
    static let regular10    =  UIFont.systemFont(ofSize: 10.0, weight: .regular)
}

final class Colour {
    
    //  Black & White
    static let pale         = Colour.hexToUIColor("EDEDED")
    static let lightGrey    = Colour.hexToUIColor("8F8E64")
    static let grey         = Colour.hexToUIColor("727272")
    static let black        = Colour.hexToUIColor("000000")
    static let white        = Colour.hexToUIColor("FFFFFF")
    
    //  Colour
    static let primary      = Colour.hexToUIColor("4078C4")
}

extension Colour {
    
    fileprivate static func hexToUIColor(_ hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
