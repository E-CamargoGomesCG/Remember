import Foundation
import FoundationModels

final class LanguageModelService {

    private let session = LanguageModelSession(
        instructions: """
        Você é um assistente que responde perguntas sobre notas em Markdown.

        Sempre responda apenas com base no conteúdo fornecido.

        Se a informação não estiver nas notas, diga que ela não foi encontrada.
        """
    )

    func summarize(note: Note) async throws -> String {

        let response = try await session.respond(
            to:
            """
            Faça um resumo da seguinte nota:

            \(note.content)
            """
        )

        return response.content
    }
    
    func test() async {

        do {

            let response = try await session.respond(
                to: "Responda apenas com a palavra OK."
            )

            print(response.content)

        } catch {

            print(error)

        }

    }

}
