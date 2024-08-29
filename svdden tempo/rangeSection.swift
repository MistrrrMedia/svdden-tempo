//
//  rangeSection.swift
//  svdden tempo
//
//  Created by Nicholas Nguyen on 8/28/24.
//

import SwiftUI

struct rangeSection: View {
    var tempo_in : Double
    var range : Double
    var color : Color
    
    var body: some View {
        HStack() {
            rangeIcon(range: range, color: color)
            Spacer()
            tempoMinMax(range: range / 100, tempo_in: tempo_in)
        }
        
        ModDivider(orientation: .horizontal, thickness: 2, padding: 0, color: color, opacity: 0.3)
    }
}
