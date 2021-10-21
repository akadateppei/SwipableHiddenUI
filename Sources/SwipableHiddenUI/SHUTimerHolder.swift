//
//  Created by AKADA TEPPEI on 2021/10/20.
//

import SwiftUI

class SHUTimerHolder : ObservableObject {
    @Published var count = 0.0
    @Published var isRunning = false

    var timer: Timer?
    let maxDuration: Double

    init(maxDuration: Double) {
        self.maxDuration = maxDuration
    }

    func start() {
        timer?.invalidate()
        count = 0
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.count += 0.01
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
}
