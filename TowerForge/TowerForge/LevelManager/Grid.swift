//
//  Grid.swift
//  TowerForge
//
//  Created by Keith Gan on 22/3/24.
//

import SpriteKit

class Grid: UnitSelectionNodeDelegate {
    private var gameScene: SKScene
    private var entityManager: EntityManager
    private var noOfRows: Int

    init(gameScene: SKScene, entityManager: EntityManager, noOfRows: Int) {
        self.gameScene = gameScene
        self.entityManager = entityManager
        self.noOfRows = noOfRows
    }

    func unitSelectionNodeDidSpawn(unitType: UnitType, position: CGPoint) {
        let snapPosition = CGPoint(x: position.x, y: snapYPosition(yPosition: position.y))
        UnitGenerator.spawnUnit(ofType: unitType, at: snapPosition, player: Player.ownPlayer, entityManager: entityManager, scene: gameScene)
    }

    private func snapYPosition(yPosition: Double) -> Double {
        let normalizedYPosition = normalizeYPosition(yPosition: yPosition)
        let screenHeight = Double(UIScreen.main.bounds.height)
        let rowHeight = screenHeight / Double(noOfRows)
        let rowIndex = Int(normalizedYPosition / rowHeight)
        let centerY = Double(rowIndex) * rowHeight + rowHeight / 2
        return denormalizeYPosition(yPosition: centerY)
    }

    private func normalizeYPosition(yPosition: Double) -> Double {
        yPosition + UIScreen.main.bounds.height / 2
    }

    private func denormalizeYPosition(yPosition: Double) -> Double {
        yPosition - UIScreen.main.bounds.height / 2
    }
}
