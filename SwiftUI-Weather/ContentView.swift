//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Muzaffer Tolga Yakar on 4.08.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Tokat, Turkey")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(Color.white)
                    .padding()
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("32°C")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(Color.white)
                }.padding(.bottom, 40)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 35)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 28)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 27)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.rain.fill", temperature: 24)
                    
                }
                Spacer()
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .clipShape(.rect(cornerRadius: 10))
                        
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
    var dayOfWeek: String;
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
