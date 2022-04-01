//
//  ContentView.swift
//  Example
//
//  Created by Alisa Mylnikova on 16/09/2021.
//  Copyright © 2019 Exyte. All rights reserved.
//

import SwiftUI
import ScalingHeaderView

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode

    @State var simplePresented = false
    @State var mapPresented = false
    @State var colorPresented = false
    @State var requestPresented = false
    @State var tabPresented = false
    @State var profilePresented = false
    @State var bankingPresented = false
    
    var body: some View {
        VStack(spacing: 32.0) {
            ExampleView(isPresented: $simplePresented, name: "Simple Scaling Header") {
                SimpleScalingHeader()
            }

            ExampleView(isPresented: $mapPresented, name: "Map Scaling Header") {
                MapScalingHeader()
            }

            ExampleView(isPresented: $colorPresented, name: "Color Scaling Header") {
                ColorScalingHeader()
            }

            ExampleView(isPresented: $requestPresented, name: "Request Scaling Header") {
                RequestScalingHeader()
            }

            ExampleView(isPresented: $tabPresented, name: "Tab Scaling Header") {
                TabScalingHeader()
            }

            ExampleView(isPresented: $profilePresented, name: "Profile Screen") {
                ProfileScreen()
            }
            
            ExampleView(isPresented: $bankingPresented, name: "Banking Screen") {
                BankingScreen()
            }
        }
    }
}

struct ExampleView<Content: View>: View {

    @Binding var isPresented: Bool
    var name: String
    @ViewBuilder var content: () -> Content

    var body: some View {
        Button(name) {
            isPresented = true
        }
        .fullScreenCover(isPresented: $isPresented) {
            content()
        }
    }
}
