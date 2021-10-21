import SwiftUI

public struct SHUPuniView: View {
    @State var startLocation: CGPoint = CGPoint.zero
    @State var translation: CGSize = CGSize.zero
    @State var isTapped = false
    @State var menuPoints: [CGPoint] = []

    private let numberOfMenu: Int = 3
    private let radiusOfMenu: Double = 15
    private let distance: Double = 100
    private var sizeOfMenu: CGSize {
        CGSize(width: radiusOfMenu * 2, height: radiusOfMenu * 2)
    }

    var theta: Double {
        2 * .pi / Double(numberOfMenu)
    }

    public init(){}

    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                startLocation = value.startLocation
                culculateMenuPositions()
                isTapped = true
                translation = value.translation
            }
            .onEnded { value in
                // fire some action
                startLocation = CGPoint.zero
                translation = CGSize.zero
                menuPoints = []
            }
    }

    public var body: some View {
        ZStack {
            Color.white
            if isTapped {
                SHUMenus(size: sizeOfMenu, menuPoints: menuPoints)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(dragGesture)
    }

    private func culculateMenuPositions() {
        for i in 0..<numberOfMenu {
            if i == 0 {
                let x = startLocation.x
                let y = startLocation.y - distance
                menuPoints.append(CGPoint(x: x, y: y))
            } else {
                // Affine transformation
                let s = startLocation
                let mb = menuPoints[i - 1]
                let x = mb.x * cos(theta) - mb.y * sin(theta) + s.x - s.x * cos(theta) + s.y * sin(theta)
                let y = mb.x * sin(theta) + mb.y * cos(theta) + s.y - s.x * sin(theta) - s.y * cos(theta)
                menuPoints.append(CGPoint(x: x, y: y))
            }
        }
    }
}
