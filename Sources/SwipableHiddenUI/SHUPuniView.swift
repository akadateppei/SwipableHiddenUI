import SwiftUI

public struct SHUPuniView: View {
    @State var startLocation: CGPoint = CGPoint.zero
    @State var translation: CGSize = CGSize.zero

    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                startLocation = value.startLocation
                translation = value.translation
            }
            .onEnded { value in
                // fire some action
                startLocation = CGPoint.zero
                translation = CGSize.zero
            }
    }

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("x: \(startLocation.x) y: \(startLocation.y)")
                    Text("width: \(translation.width) height: \(translation.height)")
                }

            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .gesture(dragGesture)
    }

    public init(){}
}
