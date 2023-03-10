//
//  BadgeView.swift
//  Badge
//
//  Created by Satyadev Chauhan on 10/03/23.
//

import SwiftUI

struct BadgeView: View {
    
    var name: String
    var color: Color = .blue
    var type: BadgeType = .normal
    
    enum BadgeType {
        case normal
        case removable(()->Void)
    }
    
    var body: some View {
        HStack{
            // Badge Label
            Text(name)
                .font(.caption.bold())
            
            // Badge 'x' if removable and setup tap gesture
            switch type {
                case .removable(let callback):
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 8, height: 8, alignment: .center)
                        .font(Font.caption.bold())
                        .onTapGesture {
                            callback()
                        }
                default:
                    EmptyView()
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(color)
        .cornerRadius(20)
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(name: "Swift")
    }
}
