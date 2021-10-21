//
//  SwiftUIView.swift
//  
//
//  Created by AKADA TEPPEI on 2021/10/21.
//

import SwiftUI

struct SHUMenus: View {
    let size: CGSize
    var menuPoints: Binding<[CGPoint]>

    var body: some View {
        ForEach(menuPoints.wrappedValue, id: \.x) { point in
            Circle()
                .fill(Color.red)
                .frame(width: size.width, height: size.height)
                .position(point)
        }
    }

    init(size: CGSize, menuPoints: Binding<[CGPoint]>) {
        self.size = size
        self.menuPoints = menuPoints
    }
}
