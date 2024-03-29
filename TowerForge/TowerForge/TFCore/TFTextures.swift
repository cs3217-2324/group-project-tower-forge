//
//  TFTextures.swift
//  TowerForge
//
//  Created by Vanessa Mae on 14/03/24.
//

import Foundation
import SpriteKit

class TFTextures {
    var textures: [SKTexture]
    var mainTexture: SKTexture

    init(textureNames: [String], textureAtlasName: String, mainTextureName: String? = nil) {
        let textureAtlas = SKTextureAtlas(named: textureAtlasName)
        self.textures = textureNames.map { textureAtlas.textureNamed($0) }

        // Set a main texture from the lists of textures
        if let mainTextureName = mainTextureName, let index = textureNames.firstIndex(of: mainTextureName) {
            mainTexture = textures[index]
        } else {
            mainTexture = textures.first ?? SKTexture()
        }
    }
}
