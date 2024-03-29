import Foundation
import XCTest
@testable import TowerForge

final class MoveEventTests: XCTestCase {

    func test_initializeMoveEvent() {
        let entityId = UUID()
        let timestamp = 1.0
        let displacement: CGVector = .zero

        let moveEvent = MoveEvent(on: entityId, at: timestamp, with: displacement)

        XCTAssertEqual(moveEvent.timestamp, timestamp,
                       "MoveEvent must have the same timestamp as originally specified")

        XCTAssertEqual(moveEvent.entityId, entityId,
                       "MoveEvent must have the same entityId as originally specified")

        XCTAssertEqual(moveEvent.displacement, displacement,
                       "MoveEvent must have the same displacement as originally specified")
    }

}
