import SwiftUI

struct FindZodiacView: View {
    // Array of months and days
    let months = Calendar.current.monthSymbols
    let days = Array(1...31)
    // State variables to hold the selected month and day
    @State private var selectedMonth = Calendar.current.component(.month, from: Date()) - 1// Month is 0-indexed
    @State private var selectedDay = Calendar.current.component(.day, from: Date())
    @State private var zodiacSign = ""
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading) {
                Text("Selected date: \(months[selectedMonth]) \(selectedDay)")
                    .padding()
                    .font(.custom("Uphoria Endeavour - Demo", size: 30))
                    .foregroundStyle(.beige)
                
                HStack(spacing: 80) {
                    // Month Picker
                    Picker("Month", selection: $selectedMonth) {
                        ForEach(0..<months.count, id: \.self) { index in
                            Text(months[index])
                                .tag(index)
                                .foregroundStyle(.beige)
                                .font(.custom("Uphoria Endeavour - Demo", size: 30))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 150)
                    .onChange(of: selectedMonth) {
                        updateZodiacSign()
                    }
                    
                    // Day Picker
                    Picker("Day", selection: $selectedDay) {
                        ForEach(1...daysInMonth(selectedMonth), id: \.self) { day in
                            Text("\(day)")
                                .tag(day)
                                .foregroundStyle(.beige)
                                .font(.custom("Uphoria Endeavour - Demo", size: 30))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    .onChange(of: selectedDay) {
                        updateZodiacSign()
                    }
                }
                
                VStack {
                    
                    Text("Your Zodiac Sign is: \(zodiacSign)")
                        .foregroundStyle(.beige)
                        .font(.custom("Uphoria Endeavour - Demo", size: 30))
                        .padding()
                    
                    Image(zodiacSign)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.beige)
                }
            }
        }
        .onAppear() {
            updateZodiacSign()
        }
        
    }
    
    private func daysInMonth(_ month: Int) -> Int {
        let year = Calendar.current.component(.year, from: Date())
        let dateComponents = DateComponents(year: year, month: month + 1) // month is 0-indexed
        let range = Calendar.current.range(of: .day, in: .month, for: Calendar.current.date(from: dateComponents)!)
        return range?.count ?? 31
    }
    private func getZodiac(month: Int, day: Int) -> String {
        print(month + 1, day)
        switch (month + 1, day) {
        case (1, 1...19): return "Capricorn"
        case (1, 20...31): return "Aquarius"
        case (2, 1...18): return "Aquarius"
        case (2, 19...29): return "Pisces"
        case (3, 1...20): return "Pisces"
        case (3, 21...31): return "Aries"
        case (4, 1...19): return "Aries"
        case (4, 20...30): return "Taurus"
        case (5, 1...20): return "Taurus"
        case (5, 21...31): return "Gemini"
        case (6, 1...20): return "Gemini"
        case (6, 21...30): return "Cancer"
        case (7, 1...22): return "Cancer"
        case (7, 23...31): return "Leo"
        case (8, 1...22): return "Leo"
        case (8, 23...31): return "Virgo"
        case (9, 1...22): return "Virgo"
        case (9, 23...30): return "Libra"
        case (10, 1...22): return "Libra"
        case (10, 23...31): return "Scorpio"
        case (11, 1...21): return "Scorpio"
        case (11, 22...30): return "Sagittarius"
        case (12, 1...21): return "Sagittarius"
        case (12, 22...31): return "Capricorn"
        default: return "Unknown"
        }
    }
    
    private func updateZodiacSign() {
        zodiacSign = getZodiac(month: selectedMonth, day: selectedDay)
    }

}

#Preview {
    FindZodiacView()
}
