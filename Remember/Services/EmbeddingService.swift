/// IAAAAAAA -- estudar

import Foundation
import NaturalLanguage

final class EmbeddingService {

    private let model: NLContextualEmbedding?

    init() {
        let model = NLContextualEmbedding(script: .latin)
        try? model?.load()
        self.model = model
    }

    func embedding(for text: String) -> [Double]? {
        guard let model else { return nil }

        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }

        guard let result = try? model.embeddingResult(for: trimmed, language: .portuguese) else {
            return nil
        }

        var soma: [Double] = []
        var contador = 0

        result.enumerateTokenVectors(in: trimmed.startIndex..<trimmed.endIndex) { vetor, _ in
            if soma.isEmpty {
                soma = vetor
            } else {
                for i in 0..<min(soma.count, vetor.count) {
                    soma[i] += vetor[i]
                }
            }
            contador += 1
            return true
        }

        guard contador > 0 else { return nil }
        return soma.map { $0 / Double(contador) }
    }

    func cosineSimilarity(_ a: [Double], _ b: [Double]) -> Double {
        guard a.count == b.count, !a.isEmpty else { return 0 }

        var dot = 0.0, normA = 0.0, normB = 0.0
        for i in 0..<a.count {
            dot += a[i] * b[i]
            normA += a[i] * a[i]
            normB += b[i] * b[i]
        }
        guard normA > 0, normB > 0 else { return 0 }
        return dot / (normA.squareRoot() * normB.squareRoot())
    }
}
