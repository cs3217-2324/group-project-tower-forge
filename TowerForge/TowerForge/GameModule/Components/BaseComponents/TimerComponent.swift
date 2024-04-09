//
//  TimerComponent.swift
//  TowerForge
//
//  Created by Vanessa Mae on 27/03/24.
//

import Foundation

class TimerComponent: TFComponent {
    var time: TimeInterval
    override var componentType: TFComponentType { .TimerComponent }
    init(timeLength: TimeInterval) {
        self.time = timeLength
        super.init()
    }
    override func update(deltaTime: TimeInterval) {
        self.time -= deltaTime
        guard let labelComponent = entity?.component(ofType: LabelComponent.self) else {
            return
        }
        labelComponent.changeText(String(Int(self.time)))
    }
}
