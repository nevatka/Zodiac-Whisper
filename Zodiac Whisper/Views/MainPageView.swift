import SwiftUI

struct MainPageView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                VStack {
                    chooseButton()
                }
            }
        }
    }
}

private func chooseButton() -> some View {
    
    VStack(spacing: 30) {
        HStack {
            NavigationLink(destination: BackgroundView()) {
                Text("Choose your sign")
                    .font(.custom("Uphoria Endeavour - Demo", size: 27))
                    .foregroundColor(.accentColor)
            }
            Image(systemName: "moon.stars.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(.accentColor)
        }
        
        HStack {
            NavigationLink(destination: BackgroundView()) {
                Text("Find out what your zodiac sign is")
                    .font(.custom("Uphoria Endeavour - Demo", size: 27))
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
