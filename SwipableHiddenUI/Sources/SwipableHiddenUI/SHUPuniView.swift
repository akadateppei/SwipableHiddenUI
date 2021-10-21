import SwiftUI

public struct SHUPuniView: View {
    @State var startLocation: CGPoint = CGPoint.zero
    @State var translation: CGSize = CGSize.zero
    @State var isTapped = false
    @State var menuPoints: [CGPoint] = []

    // It may not work properly for even numbers.
    private let numberOfMenu: Int = 3
    private let radiusOfMenu: Double = 15
    private let distance: Double = 100
    private var sizeOfMenu: CGSize {
        CGSize(width: radiusOfMenu * 2, height: radiusOfMenu * 2)
    }

    var angle: Double {
        2 * .pi / Double(numberOfMenu)
    }

    public init(){}

    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                startLocation = value.startLocation

                withAnimation(.easeOut(duration: 0.3)) {
                    menuPoints = SHUCulculator.culculateMenuPoints(number: numberOfMenu,
                                                                   distance: distance,
                                                                   centerPoint: startLocation,
                                                                   angle: angle)
                }
                translation = value.translation
            }
            .onEnded { value in
                // fire some action
                menuPoints.removeAll()
                startLocation = CGPoint.zero
                translation = CGSize.zero
            }
    }

    public var body: some View {
        ZStack {
            Color.white
            SHUMenus(size: sizeOfMenu, menuPoints: $menuPoints)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(dragGesture)
    }
}
