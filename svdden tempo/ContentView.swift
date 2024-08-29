//
//  ContentView.swift
//  svdden tempo
//
//  Created by Nicholas Nguyen on 8/28/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var tempo_in : Double = 120
    @State var range_in : Double = 0
    @State private var rangeList : [rangeAndColor] = [
        rangeAndColor(range: 6, color: .green),
        rangeAndColor(range: 10, color: .red),
        rangeAndColor(range: 16, color: .white)
    ]
    
    struct rangeAndColor: Identifiable {
        var range : Double = 0
        var color : Color = .white
        var id : UUID = UUID()
    }
    
    func createRangeInstance() {
        let red = Double.random(in: 0.65...1)
        let green = Double.random(in: 0.65...1)
        let blue = Double.random(in: 0.65...1)
        let randomColor = Color.init(red: red, green: green, blue: blue)
        
        if(range_in < 0){
            range_in *= -1
        }
        
        rangeList.append(rangeAndColor(range: range_in, color: randomColor))
        range_in = 0;
    }
    
    var body: some View {
        VStack(alignment: .center) {
            // decrement tempo, tempo input, increment tempo
            Spacer()
            HStack(alignment: .center) {
                Button(action: {tempo_in -= 1}) {
                    Label("decrement", systemImage: "minus.circle.fill")
                        .labelStyle(.iconOnly)
                        .fontWeight(.bold)
                        .foregroundColor((colorScheme == .light) ? .black : .white)
                }
                Spacer()
                HStack {
                    TextField("speeeeeeed", value: $tempo_in, format: .number.precision(.fractionLength(1)))
                        .frame(width: 200)
                        .fontWeight(.bold)
                }
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                
                Spacer()
                Button(action: {tempo_in += 1}) {
                    Label("increment", systemImage: "plus.circle.fill")
                        .labelStyle(.iconOnly)
                        .fontWeight(.bold)
                        .foregroundColor((colorScheme == .light) ? .black : .white)
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 80)
            
            Spacer().frame(height: 20)
            
            // defines box height & padding
            ZStack {
                Rectangle()
                    .cornerRadius(20)
                    .foregroundColor((colorScheme == .light) ? .black : Color.init(red: 0.1, green: 0.1, blue: 0.1))
                // second layer defines "inner padding"
                VStack {
                    // range sections
                    ForEach(rangeList) { rangeAndColor in
                        rangeSection(tempo_in: tempo_in, range: rangeAndColor.range, color: rangeAndColor.color)
                    }
                    
                    // add range
                    if (rangeList.count < 6)
                    {
                        HStack {
                            TextField("enter a custom range", value: $range_in, format: .number.precision(.fractionLength(1)))
                            
                            Button(action: createRangeInstance) {
                                Label("Add", systemImage: "plus")
                                    .labelStyle(.iconOnly)
                            }
                            .padding(.top, 4.0)
                        }
                    }
                }
                .foregroundColor(.white)
                .padding(16)
            }
            .frame(height: 100)
            .padding(16)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
