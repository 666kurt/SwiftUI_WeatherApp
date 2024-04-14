//
//  ContentView.swift
//  Weather App
//
//  Created by Максим Шишлов on 14.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("lightBlue"))
            
            VStack {
                Text("Ulyanovsk, RU")
                    .foregroundStyle(.white)
                    .font(.system(size: 32, weight: .bold))
                    .padding()
                
                Spacer()
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                    Text("24°C")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .bold))
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "WED", weatherImage: "cloud.sun.fill", temp: 24)
                    
                    WeatherDayView(dayOfWeek: "WED", weatherImage: "cloud.sun.fill", temp: 24)
                    
                    WeatherDayView(dayOfWeek: "WED", weatherImage: "cloud.sun.fill", temp: 24)
                    
                    WeatherDayView(dayOfWeek: "WED", weatherImage: "cloud.sun.fill", temp: 24)
                    
                    WeatherDayView(dayOfWeek: "WED", weatherImage: "cloud.sun.fill", temp: 24)

                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Change day time".uppercased())
                        .foregroundStyle(.blue)
                        .padding()
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .padding()
                
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    let dayOfWeek: String
    let weatherImage: String
    let temp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.white)
            Image(systemName: weatherImage)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
            Text("\(temp)°C")
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .bold))
        }
    }
}

struct BackgroundView: View {
    
    let topColor: Color
    let bottomColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}
