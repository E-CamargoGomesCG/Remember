//
//  FileSystemService.swift
//  Remember
//
//  Created by Natali Queiróz on 07/08/26.
//

import Foundation

final class FileSystemService {
    
    private let parser = MarkdownParser()
    
    func loadNotes(from folderURL: URL) throws -> [Note] {
        
        let fileManager = FileManager.default
        
        let files = try fileManager.contentsOfDirectory(at:folderURL, includingPropertiesForKeys: nil)
        
        let markdownFiles = files.filter {
            
            $0.pathExtension == "md"
        }
        
        var notes: [Note] = []
        
        for fileURL in markdownFiles {
            
            let markdown = try String(contentsOf: fileURL, encoding: .utf8)
            
            let note = try parser.parse(markdown, from: fileURL)
            
            notes.append(note)
        }
        return notes
    }
}
