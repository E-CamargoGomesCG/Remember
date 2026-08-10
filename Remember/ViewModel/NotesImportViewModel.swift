//
//  NotesImportViewModel.swift
//  Remember
//
//  Created by Natali Queiróz on 08/08/26.
//

import Foundation
import AppKit
import Observation

@Observable
final class NotesImportViewModel {
    
    private let fileSystemService = FileSystemService()
    
    private let languageModelService = LanguageModelService()
    
    var notes: [Note] = []
    
    var folderName = "Nenhuma pasta"
    
    func selecionarVault() {
        
        let panel = NSOpenPanel()
        
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        panel.allowsMultipleSelection = false
        panel.prompt = "Selecionar Vault"
        
        if panel.runModal() == .OK,
           let url = panel.url {
            
            folderName = url.lastPathComponent
            
            do {
                
                notes = try fileSystemService.loadNotes(from: url)
                
                print("Notas importadas: \(notes.count)")
                
                if let firstNote = notes.first {
                    
                    Task {
                        
                        do {
                            
                            let answer = try await languageModelService.answer(
                                question: "O que são Foundation Models?",
                                using: notes
                            )

                            print("========== RESPOSTA ==========")
                            print(answer)
                            print("==============================")
                        } catch {
                            
                            print("Erro Foundation Models:")
                            print(error)
                            
                        }
                        
                    }
                    
                }
                
            } catch {
                
                print(error)
                
            }
        }
    }
}
