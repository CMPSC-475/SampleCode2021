//
//  AppRow.swift
//  Top Apps
//
//  Created by Hannan, John Joseph on 10/25/21.
//

import SwiftUI

struct AppRow: View {
    @EnvironmentObject var manager : TopAppManager
    var appInfo : AppInfo
    var body : some View {
        HStack {
            //TODO: Image goes hereif
            if let data = appInfo.imageData {
                let image = UIImage(data: data)
                Image(uiImage:image!)
            } else {
                
            }
            VStack {
                Text(appInfo.title)
                Text(appInfo.author)
            }
        }
    }
}

struct AppRow_Previews: PreviewProvider {
    static var previews: some View {
        AppRow(appInfo: AppInfo.standard)
    }
}
