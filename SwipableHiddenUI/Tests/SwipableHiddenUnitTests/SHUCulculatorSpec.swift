//
//  Created by AKADA TEPPEI on 2021/10/22.
//

import Foundation
import XCTest

@testable import SwipableHiddenUI

class SHUCulculatorSpec: XCTestCase {
    func testCulculateMenuPoints() {
        var number = 3
        let distance = 100.0
        let centerPoint = CGPoint(x: 100, y: 100)
        var angle: Double {
            2 * .pi / Double(number)
        }

        var points: [CGPoint] = []

        // It's generally fine, so compare the rounded values
        SHUCulculator.culculateMenuPoints(
            number: number,
            distance: distance,
            centerPoint: centerPoint,
            angle: angle
        ).forEach { point in
            let point = CGPoint(x: round(point.x), y:round(point.y))
            points.append(point)
        }

        var correctPoints: [CGPoint] = [
            .init(x: 100.0, y: 0.0),
            .init(x: 187.0, y: 150.0),
            .init(x: 13.0, y: 150.0)
        ]

        // Check if the number of points is correct
        XCTAssertEqual(points.count, number)

        // Check if the culculated points is correct
        XCTAssertEqual(points, correctPoints)

        // Change the number of menus and try again
        points.removeAll()
        number = 4
        correctPoints = [
            .init(x: 100.0, y: 0.0),
            .init(x: 200.0, y: 100.0),
            .init(x: 100.0, y: 200.0),
            .init(x: 0.0, y: 100.0)
        ]
        SHUCulculator.culculateMenuPoints(
            number: number,
            distance: distance,
            centerPoint: centerPoint,
            angle: angle
        ).forEach { point in
            let point = CGPoint(x: round(point.x), y:round(point.y))
            points.append(point)
        }
        XCTAssertEqual(points.count, number)
        XCTAssertEqual(points, correctPoints)
    }
}
