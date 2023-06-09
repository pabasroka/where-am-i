//
//  LanguagesView.swift
//  weatherAppSwiftUI
//
//  Created by RMS on 05/05/2023.
//

import SwiftUI
import Foundation

struct LanguageData: Hashable, Codable, Equatable, Identifiable  {
    var id: Int
    let language: String
    let sentences: Sentences
    let flag: String
}

struct Sentences: Hashable, Codable {
    let hello: String
    let goodbye: String
    let thank_you: String
    let where_is_airport: String
    let where_is_post_office: String
}

struct LanguagesView: View {
    var englishSentence = [Sentences]()
    init(englishSentence: [Sentences] = [Sentences]()) {
        self.englishSentence = englishSentence
    }
    @State var languages: [LanguageData] = []
    var body: some View {
            List(languages) { language in
                HStack{
                    FlagCircle(flagItem: language.flag)
                    NavigationLink(destination: LanguageDetailView(languageData: language), label: {
                        Text(language.language)
                    })
                }
            }.onAppear{
               let data = jsonData.data(using: .utf8)!
                do {
                    let decodedData: [LanguageData] = try JSONDecoder().decode([LanguageData].self, from: data)
                    languages = decodedData
                    print(decodedData)
                } catch {
                    languages = []
                    print(error)
                }
            }
        
        
    }
    
    let jsonData = """
    [
        {
            "id": 1,
            "language": "English",
            "sentences": {
                "hello": "hello",
                "goodbye": "goodbye",
                "thank_you": "thank you",
                "where_is_airport": "where is the airport",
                "where_is_post_office": "where is the post office"
            },
            "flag": "\u{1F1FA}\u{1F1F8}"
        },
        {
            "id": 2,
            "language": "Spanish",
            "sentences": {
                "hello": "hola",
                "goodbye": "adiós",
                "thank_you": "gracias",
                "where_is_airport": "¿dónde está el aeropuerto?",
                "where_is_post_office": "¿dónde está la oficina de correos?"
            },
            "flag": "\u{1F1EA}\u{1F1F8}"
        },
        {
            "id": 3,
            "language": "French",
            "sentences": {
                "hello": "bonjour",
                "goodbye": "au revoir",
                "thank_you": "merci",
                "where_is_airport": "où est l'aéroport?",
                "where_is_post_office": "où est la poste?"
            },
            "flag": "\u{1F1EB}\u{1F1f7}"
        },
        {
            "id": 4,
            "language": "Italian",
            "sentences": {
                "hello": "ciao",
                "goodbye": "arrivederci",
                "thank_you": "grazie",
                "where_is_airport": "dov'è l'aeroporto?",
                "where_is_post_office": "dov'è l'ufficio postale?"
            },
            "flag": "\u{1F1EE}\u{1F1F9}"
        },
        {
            "id": 5,
            "language": "Polish",
            "sentences": {
                "hello": "cześć",
                "goodbye": "do widzenia",
                "thank_you": "dziękuję",
                "where_is_airport": "gdzie jest lotnisko?",
                "where_is_post_office": "gdzie jest poczta?"
            },
            "flag": "\u{1F1F5}\u{1F1F1}"
        },
        {
            "id": 6,
            "language": "Indian",
            "sentences": {
                "hello": "namaste",
                "goodbye": "alvida",
                "thank_you": "dhanyavaad",
                "where_is_airport": "havaai adda kahaan hai?",
                "where_is_post_office": "daak ghar kahaan hai?"
            },
            "flag": "\u{1F1EE}\u{1F1F3}"
        },
        {
            "id": 7,
            "language": "Hungarian",
            "sentences": {
                "hello": "szia",
                "goodbye": "viszlát",
                "thank_you": "köszönöm",
                "where_is_airport": "hol van a repülőtér?",
                "where_is_post_office": "hol van a posta?"
            },
            "flag": "\u{1F1ED}\u{1F1FA}"
        }
    ]
    """
}

struct LanguagesView_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesView()
    }
}

struct FlagCircle: View {
    let flagItem: String
    
    var body: some View {
        ZStack{
            Text(flagItem)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(
                    Circle().stroke(Color.purple, lineWidth: 3)
                )
        }
    }
}
    

