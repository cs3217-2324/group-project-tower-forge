//
//  SpriteComponent.swift
//  TowerForge
//
//  Created by Vanessa Mae on 14/03/24.
//

import Foundation

class SpriteComponent: TFComponent {
    override var componentType: Enums.Components { .Sprite }
    var node: TFAnimatableNode

    init(textureNames: [String], height: CGFloat, width: CGFloat, position: CGPoint, animatableKey: String) {
        let textures = TFTextures(textureNames: textureNames, textureAtlasName: "Sprites")
        self.node = TFAnimatableNode(textures: textures, height: height, width: width, animatableKey: animatableKey)
        self.node.position = position
        super.init()
    }
}
