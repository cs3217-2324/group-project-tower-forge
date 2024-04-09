//
//  ShootingComponent.swift
//  TowerForge
//
//  Created by Vanessa Mae on 15/03/24.
//

import QuartzCore

class ShootingComponent: TFComponent {
    var fireRate: TimeInterval // Delay between shots
    var range: CGFloat
    private(set) var lastShotTime = TimeInterval(0)
    let attackPower: CGFloat
    let shootingType: BaseProjectile.Type
    override var componentType: TFComponentType { .ShootingComponent }

    init(fireRate: TimeInterval, range: CGFloat, attackPower: CGFloat, shootingType: BaseProjectile.Type) {
        self.fireRate = fireRate
        self.range = range
        self.attackPower = attackPower
        self.shootingType = shootingType
        super.init()
    }

    var canShoot: Bool {
        CACurrentMediaTime() - lastShotTime >= fireRate
    }

    func shoot() {
        lastShotTime = CACurrentMediaTime()
    }
}
