//
//  ContentView.swift
//  Badge
//
//  Created by Satyadev Chauhan on 10/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var filters: [String] = [
        "Swift", "SwiftUI", "iOS", "Mobile"
    ]
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    BadgeView(name: filter, color: .orange, type: .removable {
                        withAnimation {
                            self.filters.removeAll { $0 == filter }
                        }
                    })
                    .transition(.opacity)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
