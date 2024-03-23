//
//  Point.swift
//  TowerForge
//
//  Created by MacBook Pro on 23/03/24.
//

import Foundation

class Point: TFEntity {
    static let position = CGPoint(x: 50, y: 50)
    init(initialPoint: Int) {
        super.init()
        self.addComponent(SpriteComponent(textureNames: ["Coin"],
                                          height: 100,
                                          width: 100,
                                          position: Point.position, animatableKey: "point"))
        self.addComponent(HomeComponent(initialLifeCount: Team.lifeCount, pointInterval: Team.pointsInterval))
        self.addComponent(LabelComponent(text: String(initialPoint)))
    }
}
