//
//  CustomHeader.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/11/21.
//  Copyright © 2021 jjh9. All rights reserved.
//

import SwiftUI

struct CustomHeader: View {
    let text : String
    
    var body: some View {
        HStack {
            Text(text).padding(.leading)
            Spacer()
        }
    }
}

struct CustomHeader_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeader(text: "All States")
    }
}
