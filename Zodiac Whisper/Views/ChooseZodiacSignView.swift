import SwiftUI

struct ChooseZodiacSignView: View {
    @StateObject private var viewModel = ZodiacViewModel()
    @State var isShowingSheet: Bool = false
    let columns = [
        GridItem(.flexible()),  // Auto-resizes each column
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            BackgroundView()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    // Loop through zodiac signs and create buttons
                    ForEach(ZodiacSign.allCases) { sign in
                        VStack {
                            Button(action: {
                                Task {
                                    await viewModel.getHoroscope(sign: sign.rawValue)
                                    if viewModel.description != nil {
                                        isShowingSheet = true  // Show the sheet when horoscope is fetched
                                    }
                                }
                            }) {
                                Image(sign.rawValue)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.beige)

                            }
                            
                            Text(sign.rawValue)
                                .foregroundStyle(.beige)
                                .font(.custom("Uphoria Endeavour - Demo", size: 30))
                        }
                    }
                }
                .padding()
            }
            .padding(.bottom)
            .sheet(isPresented: $isShowingSheet) {
                if let horoscope = viewModel.description {
                    DailyZodiacView(horoscope: horoscope)
                }
            }
            .alert(viewModel.errorMessage ?? "Error", isPresented: $viewModel.showAlert) {}
        }
    }
}
    
#Preview {
    ChooseZodiacSignView()
}
