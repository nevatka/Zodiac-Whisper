import Foundation

@MainActor
class ZodiacViewModel: ObservableObject {
    @Published var dailyHoroscope: DailyHoroscope?
    @Published var errorMessage: String?
    @Published var description: String?
    
    func getHoroscope(sign: String) async throws {
        do {
            let fetchedHoroscope = try await NetworkManager.shared.fetchHoroscope(sign: sign)
            self.description = fetchedHoroscope?.horoscope_data
        } catch let error as NetworkError {
            self.errorMessage = error.errorDescription
            print(self.errorMessage)
        }
    }
}
