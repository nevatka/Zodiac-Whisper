@testable import Zodiac_Whisper

final class DailyHoroscopeRepositoryMock: DailyHoroscopeRepositoryProtocol {
    var getDailyHoroscopeCallsCount = 0
    var getDailyHoroscopeResponse: DailyHoroscope?
    var getDailyHoroscopeError: Error?
    var isError: Bool?
    var getDailyHoroscopePassedSign: String?
    
    func getDailyHoroscope(sign: String) async throws -> Zodiac_Whisper.DailyHoroscope {
        getDailyHoroscopeCallsCount += 1
        getDailyHoroscopePassedSign = sign
        if let getDailyHoroscopeResponse {
            isError = false
            return getDailyHoroscopeResponse
        } else if let getDailyHoroscopeError {
            isError = true
            throw getDailyHoroscopeError
        }
        return getDailyHoroscopeResponse!
    }
}
