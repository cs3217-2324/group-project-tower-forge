//
//  MovableComponent.swift
//  TowerForge
//
//  Created by Vanessa Mae on 15/03/24.
//

import Foundation
import CoreGraphics

class MovableComponent: TFComponent {
    override var componentType: Enums.Components { .Position }
    var velocity: CGVector
    var position: CGPoint

    init(position: CGPoint, velocity: CGVector = .zero) {
        self.velocity = velocity
        self.position = position
        super.init()
    }

    func updatePosition(to position: CGPoint) {
        self.position = position
    }

    func updatePosition(with vector: CGVector) {
        self.position.x += vector.dx
        self.position.y += vector.dy
    }

    override func update(deltaTime: TimeInterval) {
        guard let entity = entity,
              let positionComponent = entity.component(ofType: PositionComponent.self),
              let spriteComponent = entity.component(ofType: SpriteComponent.self),
              let playerComponent = entity.component(ofType: PlayerComponent.self) else {
            return
        }

        let directionVelocity = playerComponent.player.getDirectionVelocity()
        let finalX = positionComponent.position.x + (velocity.dx * CGFloat(deltaTime) * directionVelocity.dx)
        let finalY = positionComponent.position.y + (velocity.dy * CGFloat(deltaTime) * directionVelocity.dy)

        positionComponent.changeTo(to: CGPoint(x: finalX, y: finalY))
        spriteComponent.node.position = positionComponent.position
    }
}
