//
//  Grid.swift
//  TowerForge
//
//  Created by Keith Gan on 22/3/24.
//

import SpriteKit

class Grid: UnitSelectionNodeDelegate {
    let DEFAULT_NO_OF_ROWS = 8

    private var entityManager: EntityManager
    private var noOfRows: Int
    private var width: CGFloat
    private var height: CGFloat

    init(entityManager: EntityManager, screenSize: CGRect) {
        self.entityManager = entityManager
        self.noOfRows = DEFAULT_NO_OF_ROWS
        self.width = screenSize.width
        self.height = screenSize.height
    }

    func generateTileMap(scene: SKScene) {
        let screenWidth = self.width
        let screenHeight = self.height
        let tileSize = CGSize(width: screenHeight / CGFloat(noOfRows), height: screenHeight / CGFloat(noOfRows))

        guard let tileSet = SKTileSet(named: "GridTile") else {
            fatalError("Cannot find tile set")
        }

        // Calculate the number of columns needed to cover the screen width
        let numberOfColumns = Int(ceil(screenWidth / tileSize.width))
        for row in 0..<noOfRows {
            for col in 0..<numberOfColumns {
                let node = TFSpriteNode(imageName: "Road_Grid", height: tileSize.height, width: tileSize.width)
                node.anchorPoint = CGPoint(x: 0, y: 0)
                node.position = CGPoint(x: CGFloat(CGFloat(row) * tileSize.width),
                                        y: CGFloat(CGFloat(col) * tileSize.width))
                node.zPosition = -100
                scene.addChild(node)
            }
        }
    }

    func unitSelectionNodeDidSpawn<T: BaseUnit & Spawnable>(ofType type: T.Type, position: CGPoint) {
        let snapPosition = CGPoint(x: position.x, y: snapYPosition(yPosition: position.y))
        let unit = UnitGenerator.spawn(ofType: type, at: snapPosition, player: Player.ownPlayer, entityManager: entityManager)
        entityManager.add(unit)
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
        yPosition
    }

    private func denormalizeYPosition(yPosition: Double) -> Double {
        yPosition
    }
}
