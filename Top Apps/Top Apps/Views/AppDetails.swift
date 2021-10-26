//
//  AppDetails.swift
//  Top Apps
//
//  Created by Hannan, John Joseph on 10/25/21.
//

import SwiftUI

struct AppDetails: View {
    var appInfo : AppInfo
    var body: some View {
        ScrollView {
        Text(appInfo.summary)
        }
            .padding()
            .navigationTitle(appInfo.title)
    }
}

struct AppDetails_Previews: PreviewProvider {
    static var previews: some View {
        AppDetails(appInfo: AppInfo.standard)
    }
}
