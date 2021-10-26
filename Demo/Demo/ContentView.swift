//
//  ContentView.swift
//  Demo
//
//  Created by AKADA TEPPEI on 2021/10/20.
//

import SwiftUI
import SwipableHiddenUI

struct ContentView: View {
    @State var menus: [SHUMenu]

    var body: some View {
        SHUHiddenMenuView(menus: self.menus, size: .init(width: 60, height: 60))
    }

    init() {
        menus = [
            .init(image: .init(systemName: "house"), action: { print("selected 1") }),
            .init(image: .init(systemName: "pencil"), action: { print("selected 2") }),
            .init(image: .init(systemName: "person"), action: { print("selected 3") }),
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
