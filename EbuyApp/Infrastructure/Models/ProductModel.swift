//
//  ProductModel.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import Foundation

struct ProductModel: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
}
