//
//  SwiftUIView.swift
//  
//
//  Created by AKADA TEPPEI on 2021/10/25.
//

import SwiftUI

public struct SHUMenuView: View {
    let menu: SHUMenu
    let position: CGPoint
    let size: CGSize

    var animating: Binding<Bool>

    public var body: some View {
        ZStack {
            Circle()
                .frame(width: size.width, height: size.height)
                .position(x: position.x, y: position.y)
                .shadow(color: .gray, radius: 5)
                .opacity(animating.wrappedValue ? 1 : 0)
            
            menu.image
                .resizable()
                .frame(width: size.width, height: size.height)
                .foregroundColor(menu.foregroundColor)
                .background(menu.backgroundColor)
                .clipShape(Circle())
                .position(x: position.x, y: position.y)
        }
    }

    public init(menu: SHUMenu, position: CGPoint, size: CGSize, animating: Binding<Bool>) {
        self.menu = menu
        self.position = position
        self.size = size
        self.animating = animating
    }
}

public struct SHUMenu {
    let image: Image
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void

    public init(image: Image, foregroundColor: Color = .gray, backgroundColor: Color = .white, action: @escaping () -> Void) {
        self.image = image
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.action = action
    }
}
