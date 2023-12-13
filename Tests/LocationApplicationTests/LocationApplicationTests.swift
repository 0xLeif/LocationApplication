import AppState
import XCTest
import CoreLocation
@testable import LocationApplication

class MockLocationManager: LocationManager {
    func test() {
        delegate?.locationManager?(.init(), didEnterRegion: .init())
    }
}

class MyLocationApplication: LocationApplication {
    override func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion: \(region)")
    }
}

final class LocationApplicationTests: XCTestCase {
    func testLocationApplication() throws {
        let locationManagerOverride = Application.override(\.locationManager, with: MockLocationManager())

        let abc = try XCTUnwrap(Application.dependency(\.locationManager) as? MockLocationManager)

        XCTAssertNil(abc.delegate)

        Application.promote(to: MyLocationApplication.self)
        
        XCTAssertNotNil(abc.delegate)
        XCTAssertTrue(abc.delegate is MyLocationApplication)

        let mockLocationManager = try XCTUnwrap(Application.dependency(\.locationManager) as? MockLocationManager)

        mockLocationManager.test()

        locationManagerOverride.cancel()

        XCTAssertNotNil(abc.delegate)
        XCTAssertTrue(abc.delegate is MyLocationApplication)
        XCTAssertFalse(Application.dependency(\.locationManager) is MockLocationManager)
    }
}
