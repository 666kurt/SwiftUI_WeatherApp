//
//  ContentView.swift
//  Weather App
//
//  Created by Максим Шишлов on 14.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    // Создание и инициализация объекта для хранения координат
    @StateObject var locationManager = LocationManager()
    
    // Объект класса WeatherManager
    let weatherManager = WeatherManager()
    
    // Свойство для сохранения погоды
    @State var weather: WeatherModel?
    
    var body: some View {

        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(lat: location.latitude, lon: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color("bgColor"))
        
    }
}

#Preview {
    ContentView()
}

