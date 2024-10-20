struct ErrorMock: Error {
    private let description: String
    init(description: String = "") {
        self.description = description
    }
    var localizedDescription: String {
        description
    }
}
