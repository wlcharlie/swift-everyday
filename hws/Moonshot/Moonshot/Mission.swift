//
//  Mission.swift
//  Moonshot
//
//  Created by Charlie Chiou on 2024/6/1.
//

import Foundation

//struct CrewRole: Codable {
//    let name: String
//    let role: String
//}

//struct Mission: Codable, Identifiable {
//    let id: Int
//    let launchDate: String?
//    let crew: [CrewRole]
//    let description: String
//}

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
