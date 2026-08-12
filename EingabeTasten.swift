//
//  EingabeTasten.swift
//  Calculator
//
//  Created by Dominic Huber on 24.12.20.
//

import SwiftUI

class GlobalEnvirement: ObservableObject {
    @Published var ergebnis: Bool = false
    @Published var zahlaktuell: Double = 0
    @Published var eingabeaktuell: String = ""
    @Published var zahl1: Double = 0
    @Published var zahl2: Double = 0
    @Published var operation: String = ""
    @Published var dot: Bool = false
    @Published var stelle: Int = 0
    @Published var opMode: String = ""
  
    func runden(genauigkeit: Int) {
    zahlaktuell = round(zahlaktuell * pow(10, Double(genauigkeit))) / pow(10, Double(genauigkeit))
    }
    func berechne() {
        zahl2 = zahlaktuell
        if operation == "+" {
            zahlaktuell = zahl1 + zahl2
        }
        if operation == "–" {
            zahlaktuell = zahl1 - zahl2
        }
        if operation == "X" {
            zahlaktuell = zahl1 * zahl2
        }
        if operation == "÷" {
            zahlaktuell = zahl1 / zahl2
        }
        if operation == "%" {
            zahlaktuell = zahlaktuell / 100
        }
        convertZahlEingabe()
        zahl1 = 0
        zahl2 = 0
        operation = ""
        ergebnis = true
    }
    
    func convertZahlEingabe() {
        if zahlaktuell.rounded(.down) == zahlaktuell {
            eingabeaktuell = String(Int(zahlaktuell))
        }
        else {
        eingabeaktuell = String(zahlaktuell)
        }
    }
    func putIn (taste: Double) {
        if opMode != "" {
            zahlaktuell = 0
            opMode = ""
        }
        if !dot {
            zahlaktuell = zahlaktuell*10 + taste.self
            eingabeaktuell = String(Int(zahlaktuell))
        }
        else {
            stelle = stelle + 1
            if taste == 0 {
                eingabeaktuell = eingabeaktuell + "0"
            }
            else {
            zahlaktuell = zahlaktuell + taste.self * pow(10, -Double(stelle))
            convertZahlEingabe()
            }
        }
        
    }
    func dotmode() {
        if !dot {
            eingabeaktuell = eingabeaktuell + "."
        }
        dot = true
    }
}

struct EingabeTasten: View {
    @EnvironmentObject var env: GlobalEnvirement
    enum Buttons {
        case null, eins, zwei, drei, vier, fünf, sechs, sieben, acht, neun, punkt
        case plus, minus, mal, durch, gleich
        case ac, plusMinus, prozent
        
        var title: String {
            switch self {
            case .null: return "0"
            case .eins: return "1"
            case .zwei: return "2"
            case .drei: return "3"
            case .vier: return "4"
            case .fünf: return "5"
            case .sechs: return "6"
            case .sieben: return "7"
            case .acht: return "8"
            case .neun: return "9"
            case .punkt: return "."
            case .plus: return "+"
            case .minus: return "–"
            case .mal: return "X"
            case .durch: return "÷"
            case .gleich: return "="
            case .ac: return "AC"
            case .plusMinus: return "+/-"
            case .prozent: return "%"
            }
        }
        var value: Double {
            switch self {
                case .null: return 0
                case .eins: return 1
                case .zwei: return 2
                case .drei: return 3
                case .vier: return 4
                case .fünf: return 5
                case .sechs: return 6
                case .sieben: return 7
                case .acht: return 8
                case .neun: return 9
                default: return 0
            }
        }
        var backColor: Color {
            switch self {
            case .null, .eins, .zwei, .drei, .vier, .fünf, .sechs,. sieben, .acht, .neun, .punkt:
                return Color(.darkGray)
            case .ac, .plusMinus, .prozent:
                return Color(.lightGray)
            case .plus, .minus, .mal, .durch, .gleich:
                return Color(.orange)
            }
        }
        var frontColor: Color {
            switch self {
            case .ac, .plusMinus, .prozent:
                return .black
            default:
                return .white
            }
        }
        var typ: String {
            switch self {
            case .null, .eins, .zwei, .drei, .vier, .fünf, .sechs,. sieben, .acht, .neun:
                return "Zahl"
            case .plus, .minus, .mal, .durch, .gleich, .prozent:
                return "Operand"
            default:
                return "Other"
            }
        }
    }
    let buttons: [[Buttons]] = [
        [.ac, .plusMinus, .prozent, .durch],
        [.sieben, .acht, .neun, .mal],
        [.vier, .fünf, .sechs, .minus],
        [.eins, .zwei, .drei, .plus],
        [.null, .punkt, .gleich]
    ]
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.ignoresSafeArea()
            VStack(spacing: 13) {
                HStack {
                    Spacer()
                    Text(env.eingabeaktuell)
                        .foregroundColor(.white)
                        .font(.system(size: 42))
                }.padding()
                HStack {
                    Spacer()
                    Text(env.opMode)
                        .frame(width: 30, height: 30, alignment: .trailing)
                        .font(.system(size: 30))
                        .foregroundColor(.orange)
                }.padding(.trailing)
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 13) {
                        ForEach(row, id: \.self) { button in
                            Button(action: {action(button: button)}) {
                                Text(button.title)
                                    .offset(x: buttonOffset(button: button))
                                    .font(.system(size: 30))
                                    .frame(width: buttonWidth(button: button), height: buttonHeight())
                            }
                            .foregroundColor(button.frontColor)
                            .background(button.backColor)
                            .cornerRadius(buttonHeight())
                        }
                    }
                }
            }
        }
    }
    func buttonOffset(button: Buttons) ->CGFloat {
        if button == .null {
            return -(6.5 + (UIScreen.main.bounds.width - 5 * 13) / 8)
        }
        return 0
    }
    func buttonWidth(button: Buttons) -> CGFloat {
        if button == .null {
            return 13 + (UIScreen.main.bounds.width - 5 * 13) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 13) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 13) / 4
    }
    
    func deleteAll() {
        env.ergebnis = false
        env.zahlaktuell = 0
        env.eingabeaktuell = ""
        env.zahl1 = 0
        env.zahl2 = 0
        env.operation = ""
        env.dot = false
        env.stelle = 0
        env.opMode = ""
    }
    func action(button: Buttons) {
        if button.typ == "Zahl" {
            env.putIn(taste: button.value)
        return
        }
        if button.typ == "Operand" {
            if button == .gleich {
                env.berechne()
            }
            else {
                if env.zahl1 != 0 {
                    env.berechne()
                }
            env.zahl1 = env.zahlaktuell
            env.operation = button.title
            env.opMode = button.title
            env.dot = false
            }
            env.stelle = 0
        }
        else {
            if button == .plusMinus {
                env.zahlaktuell = -env.zahlaktuell
                env.convertZahlEingabe()
            }
            if button == .ac {
                deleteAll()
            }
            if button == .punkt {
                env.dotmode()
            }
        }
    }
}

struct Eingabe_Previews: PreviewProvider {
    static var previews: some View {
        EingabeTasten().environmentObject(GlobalEnvirement())
    }
}
