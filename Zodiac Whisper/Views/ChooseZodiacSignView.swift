import SwiftUI

struct ChooseZodiacSignView: View {
    
    let zodiacSigns = [
        "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]
    
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
                    ForEach(zodiacSigns, id: \.self) { sign in
                        VStack {
                            Button(action: {
                                // Handle button tap
                                print("\(sign) tapped")
                            }) {
                                Image(sign)                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.beige)

                            }
                            
                            Text(sign)
                                .foregroundStyle(.beige)
                                .font(.custom("Uphoria Endeavour - Demo", size: 30))
                        }
                    }
                }
                .padding()
            }
            .padding(.bottom)
        }
        
    }
}
    
#Preview {
    ChooseZodiacSignView()
}
