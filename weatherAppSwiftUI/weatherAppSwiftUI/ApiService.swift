//
//  ApiService.swift
//  weatherAppSwiftUI
//
//  Created by RMS on 21/04/2023.
//

import Foundation

struct Welcome: Decodable {
    let base: String
    let main: Main
    let visibility: Int
    let dt: Int
    let timezone, id: Int
    let cod: Int
}

struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
            case temp
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
            case pressure, humidity
        }
}

class WeatherService {
    
//    func getWeatherDataByCity(city: String) async throws -> WeatherData {
//        print(city)
//        let apiKey = "f616691775030eebce5e788dd3e6a413"
//        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let decoded: WeatherData = try! JSONDecoder().decode(WeatherData.self, from: data)
//
//        return decoded
//    }
    
//    func getWeekWeatherDataByCity(city: String) async throws -> WeatherWeek {
//        let weatherData = try await getWeatherDataByCity(city: city)
////        print(weatherData.coord.lon)
////        print(weatherData.coord.lat)
//        let apiKey = "f616691775030eebce5e788dd3e6a413"
//        let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(weatherData.coord.lat)&lon=\(weatherData.coord.lon)&appid=\(apiKey)")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let decoded = try JSONDecoder().decode(WeatherWeek.self, from: data)
//        print(decoded)getWeatherDataByCoord
//        return decoded
//    }
    
    func getWeatherDataByCoord(lat: String, lon: String) async throws -> Welcome {
        let apiKey = "f616691775030eebce5e788dd3e6a413"
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded: Welcome = try JSONDecoder().decode(Welcome.self, from: data)
        return decoded
    }
    
    func getCityCoord(city: String) async throws -> CoordCity {
        let apiKey = "f616691775030eebce5e788dd3e6a413"
        let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=1&appid=\(apiKey)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(CoordElement.self, from: data)
        
        return CoordCity(lat: decoded.lat ?? 0.0, lon: decoded.lon ?? 0.0)
    }
    
}
