import Foundation

struct Note: Identifiable, Hashable {
    let id: UUID
    let title: String
    let content: String
    let url: URL
}
