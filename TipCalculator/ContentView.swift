//
//  ContentView.swift
//  TipCalculator
//
//  Created by Arpit on 2026-10-02.
//

import SwiftUI

struct ContentView: View {
    @State private var total = ""
    @State var tipPercentage = 15.0
    
    var tipAmount: Double {
        guard let totalNum = Double(total) else { return 0 }
        return (totalNum * tipPercentage / 100)
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "dollarsign.circle.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .font(.title)
                Text("Tip Calculator")
                    .font(.largeTitle)
            }
            HStack {
                Text("$")
                TextField("Amount", text: $total)
            }
            HStack {
                Slider(value: $tipPercentage, in: 0...30, step: 1.0)
                Text("\(Int(tipPercentage)) %")
            }
            if let totalNum = Double(total) {
                Text("Tip Amount: $\(totalNum * tipPercentage / 100, specifier: "%.2f")")
            
                Text("Total Payment: $\(tipAmount + totalNum, specifier: "%.2f")")
                    .padding(8)
                    .font(.title2)
                    .fontWeight(.bold)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .padding(.top)
            }
            else if total.isEmpty {
                Text("Please enter amount")
            }
            else {
                Text("Enter valid Number")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
