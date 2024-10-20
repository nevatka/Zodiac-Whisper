import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided is invalid."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .decodingError:
            return "There was an error decoding the response."
        }
    }
}

protocol NetworkManaging {
    func fetchHoroscope(sign: String) async throws -> DailyHoroscope
}

class NetworkManager: NetworkManaging {
    static let shared = NetworkManager()
    private let session: URLSession
    
    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchHoroscope(sign: String) async throws -> DailyHoroscope {
        guard let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(sign)&day=TODAY") else {
            print("Invalid URL")
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        // Check if the response is valid
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("Error: HTTP Request failed")
            throw NetworkError.invalidResponse
        }
        
        // Decode the JSON response
        do {
            let decodedData = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
            return decodedData.data
        } catch {
            throw NetworkError.decodingError
        }
    }
}
