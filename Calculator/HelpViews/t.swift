//
//  t.swift
//  Calculator
//
//  Created by Dominic Huber on 24.12.20.
//

import SwiftUI

struct EingabeTasten: View {
    var eingabe: Eingabe
    public func putIn (taste: Double) {
        if !eingabe.dot {
            eingabe.zahlaktuell = eingabe.zahlaktuell*10 + taste.self
        }
        else {
            eingabe.zahlaktuell = eingabe.zahlaktuell + taste.self * Double(10^(-eingabe.stelle))
        }
    }
    public func dotmode() {
        eingabe.dot = true
    }
    var body: some View {
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Reset")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("/")
                }
                .padding()
            }
            .padding()
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("7")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("8")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("9")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("*")
                }
                .padding()
            }
            .padding()
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("4")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("5")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("6")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("-")
                }
                .padding()
            }
            .padding()
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("1")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("2")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("3")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("+")
                }
                .padding()
            }
            .padding()
            
            HStack {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("0")
                }
                .padding()
                .padding(.trailing, 70)
                
                Spacer()
                
                Button(action: {dotmode()}) {
                    Text(".")
                }
                .padding()
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("=")
                }
                .padding()
            }
            .padding()
        }
    }
}

struct Eingabe_Previews: PreviewProvider {
    static var previews: some View {
        EingabeTasten(eingabe: eingabe)
            .previewLayout(.fixed(width: 350, height: 500))
    }
}
