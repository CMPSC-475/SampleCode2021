//
//  StateManager.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import Foundation

class StateManager : ObservableObject {
    @Published var stateModel = StateModel()
    
    func formatFor(year:Int) -> String {
        String(format: "%04d", year)
    }

    /*
    func sectionInfo(for sectioning:Sectioning) -> [SectionInfo] {
        return []
    }
 */
    
    /*
    func sectionTitles(for property : (USState) -> String) -> [String] {
    }
 
 */
    
    /*
    func indices(for property : (USState) -> Bool) -> [Int] {
    }
 */
}
