//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Muzaffer Tolga Yakar on 5.08.2025.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    var title: String;
    var textColor: Color;
    var backgroundColor: Color;
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .medium, design: .default))
            .clipShape(.rect(cornerRadius: 10))
    }
}
