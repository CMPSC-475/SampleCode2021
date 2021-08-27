//
//  RedSquaresView.swift
//  SwiftUI Examples
//
//  Created by Hannan, John Joseph on 8/27/21.
//

import SwiftUI

struct RedSquaresView: View {
    var body: some View {
        VStack {
            RedSquareRow()
            Spacer()
            RedSquareRow()
        }
    }
}

struct RedSquareRow : View {
    var body : some View {
        HStack {
            RedSquareView()
            Spacer()
            RedSquareView()
        }
    }
}

struct RedSquareView : View {
    let dimension : CGFloat = 50
    var body : some View {
    Rectangle()
    .foregroundColor(.red)
    .frame(width: dimension, height: dimension, alignment: .center)
    }
}


//MARK: - Previews
struct RedSquaresView_Previews: PreviewProvider {
    static var previews: some View {
        RedSquaresView()
    }
}

struct RedSquareRowView_Previews: PreviewProvider {
    static var previews: some View {
        RedSquareRow()
    }
}

struct RedSquareView_Previews: PreviewProvider {
    static var previews: some View {
        RedSquareView()
    }
}
