import Foundation

struct DailyHoroscope: Codable {
    var date: String
    var horoscope_data: String
}

struct HoroscopeResponse: Codable {
    var data: DailyHoroscope
    var status: Int
    var success: Bool
}
