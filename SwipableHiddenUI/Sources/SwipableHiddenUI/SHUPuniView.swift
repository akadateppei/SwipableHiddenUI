import SwiftUI

public struct SHUPuniView: View {
    @State var startLocation: CGPoint = CGPoint.zero
    @State var currentLocation: CGPoint = CGPoint.zero {
        didSet {
            onChangeCurrentLocation()
        }
    }
    @State var menuPoints: [CGPoint] = []
    @State var menuStates: [Bool]

    private let menus: [SHUMenu]
    private let size: CGSize
    private let distance: Double = 100

    var angle: Double {
        2 * .pi / Double(menus.count)
    }

    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { value in
                startLocation = value.startLocation
                currentLocation = value.location

                withAnimation(.easeOut(duration: 0.3)) {
                    menuPoints = SHUCulculator.culculateMenuPoints(number: menus.count,
                                                                   distance: distance,
                                                                   centerPoint: startLocation,
                                                                   angle: angle)
                }
            }
            .onEnded { value in
                fireActionIfNeeded()
                menuPoints.removeAll()
                startLocation = .zero
                currentLocation = .zero
                menuStates = .init(repeating: false, count: menus.count)
            }
    }

    public var body: some View {
        ZStack {
            Color.white
            ForEach(0..<menuPoints.count, id: \.self) { index in
                SHUMenuView(menu: menus[index], position: menuPoints[index], size: size, animating: $menuStates[index])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .gesture(dragGesture)
    }

    public init(menus: [SHUMenu], size: CGSize = .init(width: 60, height: 60)) {
        self.menus = menus
        self.size = size
        menuStates = .init(repeating: false, count: menus.count)
    }

    private func onChangeCurrentLocation() {
        for index in 0..<menuPoints.count {
            if menuPoints[index].x - size.width / 2 < currentLocation.x, currentLocation.x < menuPoints[index].x + size.width / 2,
               menuPoints[index].y - size.height / 2 < currentLocation.y, currentLocation.y < menuPoints[index].y + size.height / 2{
                menuStates[index] = true
            } else {
                menuStates[index] = false
            }
        }
    }

    private func fireActionIfNeeded() {
        for index in 0..<menuPoints.count {
            if menuPoints[index].x - size.width / 2 < currentLocation.x, currentLocation.x < menuPoints[index].x + size.width / 2,
               menuPoints[index].y - size.height / 2 < currentLocation.y, currentLocation.y < menuPoints[index].y + size.height / 2{
                menus[index].action()
            }
        }
    }
}
