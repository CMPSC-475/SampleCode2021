//
//  ErrorView.swift
//  Top Apps
//
//  Created by jjh9 on 11/3/21.
//

import SwiftUI



struct ErrorView: View {
    @Environment(\.refresh) private var action : RefreshAction?
    @Binding var error : HTTPError?
    var body: some View {
        VStack {
            Text("HTTP Error")
            Text("Status Code: \(error?.response.statusCode ?? 000)")
            Button("Dismiss") {
                error = nil
            }
            if let action = action {
                Button("Try Again") {
                    Task {
                        await action()
                    }
                    error = nil
                }
            }
            

        }.padding(30)
            .background(.gray)
            .cornerRadius(25)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: .constant(HTTPError(response: HTTPURLResponse(url: URL(fileURLWithPath: ""), statusCode: 000, httpVersion: nil, headerFields: nil)!)))
    }
}
