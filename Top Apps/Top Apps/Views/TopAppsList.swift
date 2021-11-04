//
//  TopAppsList.swift
//  Top Apps
//
//  Created by Hannan, John Joseph on 10/25/21.
//

import SwiftUI

struct TopAppsList: View {
    @EnvironmentObject var manager : TopAppManager

    var body: some View {
        NavigationView {
            List {
                ForEach(manager.topApps) {app in
                    NavigationLink(
                        destination: AppDetails(appInfo: app),
                        label: {
                            AppRow(appInfo: app)
                        })

                }
            }
            .overlay(alignment:.top) {
                if manager.httpError != nil {
                ErrorView(error: $manager.httpError)
                }
            }
            .refreshable {
                await manager.asyncRetrieveData()
            }
            //.alert("Error", isPresented: $manager.httpError, actions: {})
            
            .navigationTitle(Text("Top Apps"))

        }
    }
}

struct TopAppsList_Previews: PreviewProvider {
    static var previews: some View {
        TopAppsList()
    }
}
