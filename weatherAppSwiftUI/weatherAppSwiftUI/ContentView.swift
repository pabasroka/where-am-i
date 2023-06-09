//
//  ContentView.swift
//  weatherAppSwiftUI
//
//  Created by RMS on 14/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("WHERE THE :O AM I").font(.system(.largeTitle, design: .rounded))
                Spacer()
                
                NavigationLink(destination: LanguagesView(), tag: 1, selection: $selection){
                    Button(action: {
                        self.selection = 1
                    }){
                        HStack{
                            Spacer()
                            Text("Languages").font(.title2)
                            Spacer()
                        }
                    }.padding().background(.blue).foregroundColor(.white).clipShape(Capsule())
                }
                .padding([.horizontal], 40).padding(.bottom, 20)
                
                NavigationLink(destination: GPSView(), tag: 2, selection: $selection){
                    Button(action: {
                        self.selection = 2
                    }){
                        HStack{
                            Spacer()
                            Text("Weather").font(.title2)
                            Spacer()
                        }
                    }.padding().background(.blue).foregroundColor(.white).clipShape(Capsule())
                }
                .padding([.horizontal], 40)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
