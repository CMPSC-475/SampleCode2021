//
//  Sectioning.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/18/21.
//  Copyright © 2021 jjh9. All rights reserved.
//

import Foundation

enum Sectioning: String, CaseIterable {
    case none = "None",
         byName = "By Name",
         byDecade = "By Decade"
}

struct SectionInfo : Identifiable {
    let title : String  // title for section
    let indicies : [Int]  // indices of states for section
    var id : String {title}
}
