//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Muzaffer Tolga Yakar on 4.08.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    private let degrees: [Int] = [35, 30, 28, 27, 24]
    private let dayOfWeek: [String] = ["TUE", "WED", "THU", "FRI", "SAT"]
    private let weatherImages: [String] = ["sun.max.fill", "cloud.sun.fill", "wind.snow", "sunset.fill", "cloud.rain.fill"]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(city: "Tokat", country: "TR")
                VStack(spacing: 8) {
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", degree: 32)
                }.padding(.bottom, 40)
                HStack(spacing: 20) {
                    ForEach(0..<degrees.count, id: \.self) { index in
                        WeatherDayView(dayOfWeek: dayOfWeek[index], imageName: weatherImages[index], temperature: degrees[index])
                    }
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }.padding(0)
    }
}

#Preview {
    ContentView()
}


struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundStyle(Color.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(Color.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool

    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var city: String
    var country: String
    
    var body: some View {
        Text("\(city), \(country)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(Color.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var degree: Int
    
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        Text("\(degree)°C")
            .font(.system(size: 70, weight: .medium))
            .foregroundStyle(Color.white)
    }
}

