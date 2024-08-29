//
//  ModDivider.swift
//  svdden tempo
//
//  granular divider
//
//  Created by Nicholas Nguyen on 8/28/24.
//

import SwiftUI

struct ModDivider: View {
    var orientation: Edge.Set = .vertical
    var thickness: Double = 1
    var padding: Double =  8
    var color: Color = .gray
    var opacity: Double = 1;
    
    var body: some View {
        if (orientation == .horizontal) {
            Rectangle()
                .frame(height: thickness)
                .cornerRadius(thickness / 2)
                .foregroundColor(color)
                .padding(padding)
                .opacity(opacity)
        }
        
        // default is vertical
        else {
            Rectangle()
                .frame(width: thickness)
                .cornerRadius(thickness / 2)
                .foregroundColor(color)
                .padding(padding)
                .opacity(opacity)
        }
    }
}
