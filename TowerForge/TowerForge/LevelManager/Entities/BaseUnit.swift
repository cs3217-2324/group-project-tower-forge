//
//  BaseUnit.swift
//  TowerForge
//
//  Created by Zheng Ze on 15/3/24.
//

import Foundation

class BaseUnit: TFEntity, HasCost {
    var cost: Int    
    init(textureNames: [String],
         size: CGSize,
         key: String,
         position: CGPoint,
         maxHealth: CGFloat,
         entityManager: EntityManager,
         cost: Int,
         velocity: CGVector,
         team: Team) {
        self.cost = cost
        super.init()
        createHealthComponent(maxHealth: maxHealth, entityManager: entityManager)
        createSpriteComponent(textureNames: textureNames, size: size, key: key, position: position)
        createMovableComponent(position: position, velocity: velocity)
        createPositionComponent(position: position)
        createPlayerComponent(team: team)
    }

    private func createHealthComponent(maxHealth: CGFloat, entityManager: EntityManager) {
        let healthComponent = HealthComponent(maxHealth: maxHealth, entityManager: entityManager)
        self.addComponent(healthComponent)
    }
    private func createPositionComponent(position: CGPoint) {
        let positionComponent = PositionComponent(position: position)
        self.addComponent(positionComponent)
    }

    private func createSpriteComponent(textureNames: [String], size: CGSize, key: String, position: CGPoint) {
        let spriteComponent = SpriteComponent(textureNames: textureNames,
                                              height: size.height,
                                              width: size.width,
                                              position: position,
                                              animatableKey: key)
        self.addComponent(spriteComponent)
    }

    private func createMovableComponent(position: CGPoint, velocity: CGVector) {
        let movableComponent = MovableComponent(position: position, velocity: velocity)
        self.addComponent(movableComponent)
    }
    private func createPlayerComponent(team: Team) {
        let playerComponent = PlayerComponent(player: team.player)
        self.addComponent(playerComponent)
    }
}
