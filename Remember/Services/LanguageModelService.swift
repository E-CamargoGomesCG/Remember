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
    
    func answer(
        question: String,
        using notes: [Note]
    ) async throws -> String {

        let context = notes
            .map { """
            # \($0.title)

            \($0.content)
            """ }
            .joined(separator: "\n\n")

        let prompt = """
        A seguir estão minhas notas em Markdown.

        \(context)

        Responda à seguinte pergunta usando APENAS as informações presentes nas notas.

        Pergunta:
        \(question)

        Se a resposta não estiver nas notas, diga claramente que ela não foi encontrada.
        """

        let response = try await session.respond(to: prompt)

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
