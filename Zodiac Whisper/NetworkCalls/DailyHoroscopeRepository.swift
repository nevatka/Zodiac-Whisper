protocol DailyHoroscopeRepositoryProtocol {
    func getDailyHoroscope(sign: String) async throws -> DailyHoroscope
}

actor DailyHoroscopeRepository: DailyHoroscopeRepositoryProtocol {
    
    func getDailyHoroscope(sign: String) async throws -> DailyHoroscope {
        let response = try await NetworkManager.shared.fetchHoroscope(sign: sign)
        return response
    }
}
