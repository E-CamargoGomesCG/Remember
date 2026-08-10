/// IAAAA -- estudar

import Foundation

final class NoteSearchService {

    private let embeddingService = EmbeddingService()
    private var indexadas: [(note: Note, vector: [Double])] = []

    func index(notes: [Note]) {
        indexadas = notes.compactMap { note in
            let texto = note.title + "\n" + note.content
            guard let vetor = embeddingService.embedding(for: texto) else { return nil }
            return (note, vetor)
        }
    }

    func search(query: String, limite: Int = 3) -> [Note] {
        guard let vetorQuery = embeddingService.embedding(for: query),
              !indexadas.isEmpty else {
            return Array(indexadas.prefix(limite)).map { $0.note }
        }

        return indexadas
            .map { (note: $0.note,
                    score: embeddingService.cosineSimilarity(vetorQuery, $0.vector)) }
            .sorted { $0.score > $1.score }
            .prefix(limite)
            .map { $0.note }
    }
}
