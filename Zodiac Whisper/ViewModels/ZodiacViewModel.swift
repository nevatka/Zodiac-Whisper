import Foundation

@MainActor
class ZodiacViewModel: ObservableObject {
    @Published var dailyHoroscope: DailyHoroscope?
    @Published var errorMessage: String?
    @Published var description: String?
    @Published var showAlert: Bool = false
    
    private var repository: DailyHoroscopeRepositoryProtocol
    
    init(
        repository: DailyHoroscopeRepositoryProtocol = DailyHoroscopeRepository()
    ) {
        self.repository = repository
    }
    
    func getHoroscope(sign: String) async {
        do {
            let fetchedHoroscope = try await repository.getDailyHoroscope(sign: sign)
            self.description = fetchedHoroscope.horoscope_data
        } catch let error as NetworkError {
            self.errorMessage = error.errorDescription
            self.showAlert = true
        } catch {
        // Handle any other errors
            self.errorMessage = "An unexpected error occurred: \(error.localizedDescription)"
            self.showAlert = true
        }
    }
}
