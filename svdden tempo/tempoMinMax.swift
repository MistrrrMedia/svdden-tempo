//
//  tempoMinMax.swift
//  svdden tempo
//
//  Created by Nicholas Nguyen on 8/28/24.
//

import SwiftUI

struct tempoMinMax: View {
    var range: Double
    var tempo_in: Double
    
    var body: some View {
        HStack {
            Text("\(tempo_in * (1 - range), specifier: "%.1f")")
                .padding(2)
            Text("\(tempo_in * (1 + range), specifier: "%.1f")")
                .padding(2)
        }
        .monospaced()
    }
}
