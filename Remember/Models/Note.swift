//
//  Note.swift
//  Remember
//
//  Created by Natali Queiróz on 06/08/26.
//

import Foundation

struct Note: Identifiable {
    let id: UUID
    let title: String
    let content: String
    let url: URL
}
