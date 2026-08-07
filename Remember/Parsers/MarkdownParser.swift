//
//  MarkdownParser.swift
//  Remember
//
//  Created by Natali Queiróz on 06/08/26.
//

import Foundation

final class MarkdownParser {
    func parse(_ markdown: String, from url: URL) throws -> Note {
        let lines = markdown.components(separatedBy:  .newlines)
        
        var title =  url.deletingPathExtension().lastPathComponent
        
        for line in lines {
            
            if line.starts(with: "# "){
                
                title = String(line.dropFirst(2))
                
                break
            }
        }
        
        let content = markdown
        
        return Note(
            id: UUID(),
            title: title,
            content: content,
            url: url
        )
    }
}

