//
//  rangeIcon.swift
//  svdden tempo
//
//  Created by Nicholas Nguyen on 8/28/24.
//

import SwiftUI

struct rangeIcon: View {
    var range: Double
    var color: Color
    
    var body: some View {
        var rangeString: String = String(range)
        
        if (floor(range) == range) {
            rangeString = String(format: "%.0f", range)
        }
        
        return ZStack {
            Rectangle()
                .frame(width: 36, height: 14)
                .foregroundColor(color)

            Text((range == 100) ? "WIDE" : "±" + rangeString)
                .font(.caption)
                .foregroundColor(.black)
            
            
        }
    }
}
