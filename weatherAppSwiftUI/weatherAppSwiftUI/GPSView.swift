//
//  ItemDetailsView.swift
//  weatherAppSwiftUI
//
//  Created by RMS on 14/04/2023.
//

import SwiftUI
import Foundation
import CoreLocation
import Combine

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    @Published var coord: CLLocationCoordinate2D?
    @Published var lat: Double?
    @Published var lon: Double?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.stopUpdatingLocation()
    }

    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        coord = lastLocation?.coordinate
        print(#function, location)
    }
}

struct GPSView: View {
    @State var weatherData: Welcome?
    let weatherService = WeatherService()
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Spacer()
            if let data = weatherData {
                Spacer()
                VStack {
                    Text("Weather data in your location").font(.title2)
                    Spacer()
                }
                Spacer()
                VStack {
                    HStack{
                        Text("Temperature: ").padding([.all], 15)
                        Text(String(format: "%.2f", data.main.temp - 273.15) + "°C")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        Text("Feels like: ").padding([.all], 15)
                        Text(String(format: "%.2f", data.main.feelsLike - 273.15) + "°C")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        Text("Max temperature: ").padding([.all], 15)
                        Text(String(format: "%.2f", data.main.tempMax - 273.15) + "°C")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        Text("Min temperature: ").padding([.all], 15)
                        Text(String(format: "%.2f", data.main.tempMin - 273.15) + "°C")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        Text("Pressure: ").padding([.all], 15)
                        Text("\(data.main.pressure) hPa")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                        Text("Humidity").padding([.all], 15)
                        Text("\(data.main.humidity) %")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }.padding([.leading], 30).overlay(RoundedRectangle(cornerRadius: 16).stroke(.purple, lineWidth: 2)).padding([.all], 20)
                Spacer()
            }
        }.task {
            await getLocation()
        }
    }
    
    func getLocation() async {
        var coord = locationManager.coord!
        let lon: String = "\(coord.longitude)"
        let lat: String = "\(coord.latitude)"
        
        do {
            var result = try await weatherService.getWeatherDataByCoord(lat: lat, lon: lon)
            weatherData = result
            print(result)
        } catch {
            print(error)
        }
    }
}

struct GPSView_Previews: PreviewProvider {
    static var previews: some View {
        GPSView()
    }
}
