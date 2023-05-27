//
//  CGFloat.swift
//  SpeedOfSound
//
//  Created by Andy Yu
//

import Foundation
import UIKit

infix operator &/
extension CGFloat {
    public static func &/(lhs: CGFloat, rhs: CGFloat) -> CGFloat {
        if rhs == 0 {
            return 0
        }
        return lhs/rhs
    }
}
