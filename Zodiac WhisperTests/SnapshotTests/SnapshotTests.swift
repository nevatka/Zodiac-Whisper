import XCTest
import SnapshotTesting
import SwiftUI

@testable import Zodiac_Whisper

class ZodiacWhisperTests: XCTestCase {
    
    func testBackgroundView() {
        let backgroundView = BackgroundView()
        assertSnapshot(matching: backgroundView.toVC(), as: .image)
    }
    
    func testMainPageView() {
        let mainPageView = MainPageView()
        assertSnapshot(matching: mainPageView.toVC(), as: .image)
    }
}
