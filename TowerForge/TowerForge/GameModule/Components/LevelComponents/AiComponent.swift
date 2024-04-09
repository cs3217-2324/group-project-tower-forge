//
//  AiComponent.swift
//  TowerForge
//
//  Created by Vanessa Mae on 19/03/24.
//

import Foundation
import UIKit

class AiComponent: TFComponent {
    private var spawnableEntities: [(TFEntity & PlayerSpawnable).Type]
    private(set) var delayUnitNextSpawn: TimeInterval
    override var componentType: TFComponentType { .AiComponent }

    var chosenUnit: (TFEntity & PlayerSpawnable).Type? {
        spawnableEntities.randomElement()
    }

    var spawnLocation: CGPoint {
        let randomY = CGFloat.random(in: 200...UIScreen.main.bounds.height)
        let randomX = CGFloat.random(in: (GameWorld.worldSize.width / 2)..<GameWorld.worldSize.width)
        return CGPoint(x: randomX, y: randomY)
    }

    init(spawnableEntities: [(TFEntity & PlayerSpawnable).Type] = SpawnableEntities.playerSpawnableEntities) {
        self.spawnableEntities = spawnableEntities
        self.delayUnitNextSpawn = AiComponent.getNextInterval()
        super.init()
    }

    override func update(deltaTime: TimeInterval) {
        delayUnitNextSpawn -= deltaTime
    }

    func spawn() -> Bool {
        guard delayUnitNextSpawn <= 0 else {
            return false
        }

        delayUnitNextSpawn = AiComponent.getNextInterval()
        return true
    }

    private static func getNextInterval() -> TimeInterval {
        Double.random(in: 1...10)
    }
}
