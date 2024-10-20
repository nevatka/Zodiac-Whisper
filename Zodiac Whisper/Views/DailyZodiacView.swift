import SwiftUI

struct DailyZodiacView: View {
    let horoscope: String
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Text(horoscope)
                    .padding()
                    .foregroundStyle(.beige)
                    .multilineTextAlignment(.center)
                    .font(.custom("Uphoria Endeavour - Demo", size: 30))
            }
            .padding()
        }
    }
}
