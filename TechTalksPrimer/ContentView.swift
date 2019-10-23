//
//  ContentView.swift
//  TechTalksPrimer
//
//  Created by Nicholas Neuberger on 10/23/19.
//  Copyright © 2019 Nicholas Neuberger. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text("how are you doing?")
                    
                    Button(action:
                    {
                        print("action button clicked")
                    })
                    {
                        Text("Button Text")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
