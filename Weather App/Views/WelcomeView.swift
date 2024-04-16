//
//  WelcomeView.swift
//  Weather App
//
//  Created by Максим Шишлов on 15.04.2024.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to the Weather app")
                    .font(.system(size: 32, weight: .bold))
                Text("Shared you current location to get the weather in your area")
                    .font(.system(size: 18, weight: .medium))
                    .padding()
            }
            .foregroundStyle(.white)
            .padding()
            .multilineTextAlignment(.center)
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
            .symbolVariant(.fill)
            .font(.title2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
