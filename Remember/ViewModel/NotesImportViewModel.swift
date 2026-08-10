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

    var question = ""

    var answer = ""

    var isLoading = false

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

            } catch {

                print(error)

            }
        }
    }

    func askQuestion() async {

        guard !question.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        }

        guard !notes.isEmpty else {
            answer = "Nenhuma nota foi importada."
            return
        }

        isLoading = true

        defer {
            isLoading = false
        }

        do {

            answer = try await languageModelService.answer(
                question: question,
                using: notes
            )

        } catch {

            answer = "Erro: \(error.localizedDescription)"

        }
    }
}
