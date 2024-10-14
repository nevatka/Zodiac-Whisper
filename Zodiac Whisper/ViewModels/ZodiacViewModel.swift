import Foundation

@MainActor
class ZodiacViewModel: ObservableObject {
    @Published var dailyHoroscope: DailyHoroscope?
    @Published var errorMessage: String?
    
    func getHoroscope(sign: String) async throws {
        do {
            let fetchedHoroscope = try await NetworkManager.shared.fetchHoroscope(sign: sign)
            self.dailyHoroscope = fetchedHoroscope
        } catch {
            self.errorMessage = "Failed to load horoscope."
        }
    }
}
