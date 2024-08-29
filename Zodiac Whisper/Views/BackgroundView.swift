import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("astro-background")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .opacity(0.9)
    }
}

#Preview {
    BackgroundView()
}
