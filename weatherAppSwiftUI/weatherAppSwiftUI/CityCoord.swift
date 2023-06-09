//
//  CityCoord.swift
//  weatherAppSwiftUI
//
//  Created by RMS on 21/04/2023.
//

import Foundation

// MARK: - CoordElement
struct CoordElement: Codable {
    let name: String
    let localNames: LocalNames
    let lat, lon: Double
    let country: String

    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case lat, lon, country
    }
}

// MARK: - LocalNames
struct LocalNames: Codable {
    let ar: String?
    let ascii: String
    let bg, ca, de, el: String?
    let en, fa: String?
    let featureName: String
    let fi: String?
    let fr: String
    let gl, he, hi, id: String?
    let it, ja, la, lt: String?
    let pt, ru, sr, th: String?
    let tr, vi, zu, af: String?
    let az, da, eu, hr: String?
    let hu, mk, nl, no: String?
    let pl, ro, sk, sl: String?

    enum CodingKeys: String, CodingKey {
        case ar, ascii, bg, ca, de, el, en, fa
        case featureName = "feature_name"
        case fi, fr, gl, he, hi, id, it, ja, la, lt, pt, ru, sr, th, tr, vi, zu, af, az, da, eu, hr, hu, mk, nl, no, pl, ro, sk, sl
    }
}

// MARK: - Coord
struct CoordCity: Codable {
    let lat: Double
    let lon: Double
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}

typealias CoordData = [CoordElement]
