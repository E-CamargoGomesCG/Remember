import Foundation
import AppKit
import Observation

@Observable
final class NotesImportViewModel {

    private let searchService = NoteSearchService()
    private let fileSystemService = FileSystemService()
    private let languageModelService = LanguageModelService()

    var notes: [Note] = []
    var fontes: [Note] = []
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
                searchService.index(notes: notes)
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

            let relevantes = searchService.search(query: question, limite: 3)
                   fontes = relevantes
                   answer = try await languageModelService.answer(
                       question: question,
                       using: relevantes
            )

        } catch {

            answer = "Erro: \(error.localizedDescription)"

        }
    }
}
