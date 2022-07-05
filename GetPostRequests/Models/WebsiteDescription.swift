//
//  WebsiteDescription.swift
//  GetPostRequests
//
//  Created by Алина on 04.07.2022.
//

import Foundation

struct WebsiteDescription: Decodable {
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]
    
}
