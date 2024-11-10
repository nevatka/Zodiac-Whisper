import SwiftUI

struct MainPageView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    chooseButton()
                }
                .padding(.bottom)
            }
        }
    }
}

private func chooseButton() -> some View {
    
    VStack(spacing: 30) {
        HStack {
            NavigationLink(destination: ChooseZodiacSignView()) {
                Text("Get your daily horoscope")
                    .font(.custom("Uphoria Endeavour - Demo", size: 30))
                    .foregroundColor(.accentColor)
            }
            Image(systemName: "moon.stars.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(.accentColor)
        }
        
        HStack {
            NavigationLink(destination: FindZodiacView()) {
                Text("Find out what your zodiac sign is")
                    .font(.custom("Uphoria Endeavour - Demo", size: 30))
                    .foregroundColor(.accentColor)
            }
            Image(systemName: "sun.max.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(.accentColor)
        }
    }
}
    

#Preview {
    MainPageView()
}
