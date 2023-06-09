//
//  LanguageDetailView.swift
//  weatherAppSwiftUI
//
//  Created by RMS on 12/05/2023.
//

import SwiftUI

struct LanguageDetailView: View {
    let languageData: LanguageData
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                FlagCircle(flagItem: languageData.flag)
                Text(languageData.language).font(.largeTitle)
            }
            Spacer()
            VStack{
                HStack {
                    Text("👋").padding([.all], 15)
                    Text(languageData.sentences.hello)
                }.frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("🙏").padding([.all], 15)
                    Text(languageData.sentences.thank_you)
                }.frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("📮").padding([.all], 15)
                    Text(languageData.sentences.where_is_post_office)
                }.frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("✈️").padding([.all], 15)
                    Text(languageData.sentences.where_is_airport)
                }.frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("🫡").padding([.all], 15)
                    Text(languageData.sentences.goodbye)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.padding([.leading], 30).overlay(RoundedRectangle(cornerRadius: 16).stroke(.purple, lineWidth: 2)).padding([.all], 20)
            Spacer()
        }
    }
}
