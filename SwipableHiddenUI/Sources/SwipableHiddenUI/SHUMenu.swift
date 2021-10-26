//
//  SwiftUIView.swift
//  
//
//  Created by AKADA TEPPEI on 2021/10/25.
//

import SwiftUI

internal struct SHUMenuView: View {
    private let menu: SHUMenu
    private let position: CGPoint
    private let size: CGSize

    private var animating: Binding<Bool>

    public var body: some View {
        ZStack {
            Circle()
                .frame(width: size.width, height: size.height)
                .position(x: position.x, y: position.y)
                .shadow(color: .gray, radius: 5)
                .opacity(animating.wrappedValue ? 1 : 0)

            ZStack {
                menu.image
                    .resizable()
                    .frame(width: size.width * 0.6, height: size.height * 0.6)
                    .foregroundColor(menu.foregroundColor)
            }
            .frame(width: size.width, height: size.height)
            .foregroundColor(menu.backgroundColor)
            .clipShape(Circle())
            .position(x: position.x, y: position.y)
        }
    }

    init(menu: SHUMenu, position: CGPoint, size: CGSize, animating: Binding<Bool>) {
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
    let shadowColor: Color
    let shadowRadius: CGFloat

    public init(
        image: Image,
        foregroundColor: Color = .gray,
        backgroundColor: Color = .white,
        shadowColor: Color = .gray,
        shadowRadius: CGFloat = 5,
        action: @escaping () -> Void
    ) {
        self.image = image
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.action = action
    }
}
