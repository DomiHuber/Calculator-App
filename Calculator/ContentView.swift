//
//  ContentView.swift
//  Calculator
//
//  Created by Dominic Huber on 23.12.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        EingabeTasten().environmentObject(GlobalEnvirement())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
