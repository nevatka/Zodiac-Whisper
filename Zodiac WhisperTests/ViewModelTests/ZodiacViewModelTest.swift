@testable import Zodiac_Whisper
import XCTest

final class ZodiacViewModelTestCase: XCTestCase {
    private var sut: ZodiacViewModel!
    private var repositoryMock: DailyHoroscopeRepositoryMock!
    private var dailyHoroscopeMock: DailyHoroscope!
    
    @MainActor
    override func setUp() {
        super.setUp()
        repositoryMock = DailyHoroscopeRepositoryMock()
        dailyHoroscopeMock = ModelMocks.mockDailyHoroscope
        sut = ZodiacViewModel(
            repository: repositoryMock
        )
    }
    
    override func tearDown() {
        sut = nil
        repositoryMock = nil
        dailyHoroscopeMock = nil
        
        super.tearDown()
    }
    
    @MainActor
    func test_getDailyHoroscope_shoulReturnHoroscope_whenRepositoryReturnsHoroscope() async {
        // Arrange
        repositoryMock.getDailyHoroscopeError = nil
        repositoryMock.getDailyHoroscopeResponse = dailyHoroscopeMock
        let sign = "Taurus"
        
        // Act
        await sut.getHoroscope(sign: sign)
        
        // Assert
        XCTAssertEqual(repositoryMock.getDailyHoroscopeCallsCount, 1)
        XCTAssertEqual(repositoryMock.isError, false)
        XCTAssertEqual(repositoryMock.getDailyHoroscopePassedSign, sign)
    }
    
    @MainActor
    func test_getDailyHoroscope_shoulReturnError_whenRepositoryReturnsError() async {
        // Arrange
        let errorDescription = "Some error"
        let errorMock = ErrorMock(description: errorDescription)
        repositoryMock.getDailyHoroscopeError = errorMock
        let sign = "Taurus"
        
        // Act
        await sut.getHoroscope(sign: sign)
        
        // Assert
        XCTAssertEqual(repositoryMock.getDailyHoroscopeCallsCount, 1)
        XCTAssertEqual(repositoryMock.isError, true)
        XCTAssertEqual(repositoryMock.getDailyHoroscopePassedSign, sign)
    }
}
