//
//  Created by AKADA TEPPEI on 2021/10/21.
//

import UIKit

class SHUCulculator {
    static func culculateMenuPoints(
        number: Int,
        distance: Double,
        centerPoint: CGPoint,
        angle: Double
    ) -> [CGPoint] {
        var points: [CGPoint] = []
        for i in 0..<number {
            if i == 0 {
                let x = centerPoint.x
                let y = centerPoint.y - distance
                points.append(CGPoint(x: x, y: y))
            } else {
                // Affine transformation
                let s = centerPoint
                let mb = points[i - 1]
                let x = mb.x * cos(angle) - mb.y * sin(angle) + s.x - s.x * cos(angle) + s.y * sin(angle)
                let y = mb.x * sin(angle) + mb.y * cos(angle) + s.y - s.x * sin(angle) - s.y * cos(angle)
                points.append(CGPoint(x: x, y: y))
            }
        }
        return points
    }
}
