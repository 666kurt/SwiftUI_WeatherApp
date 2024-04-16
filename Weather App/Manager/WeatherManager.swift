//
//  WeatherManager.swift
//  Weather App
//
//  Created by Максим Шишлов on 16.04.2024.
//

import Foundation
import CoreLocation


class WeatherManager {
    
    // Метод получения погоды
    func getCurrentWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> WeatherModel {
        
        // URL для получения API
        guard let url = URL(
            string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&lang=ru&units=metric&appid=d20a25483e0ad689bf8c76f2a44c7bdb") else { fatalError("Missing URL") }
        
        // Отправка запроса по URL
        let request = URLRequest(url: url)
        
        // Сохранение результатов запроса
        let (data, responce) = try await URLSession.shared.data(for: request)
        
        // Проверка статус кода ответа
        guard (responce as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching data") }
        
        let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
        
        return decodedData
    }
    
}
