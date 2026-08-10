import SwiftUI

struct FileHeader: View {
    let name: String
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "doc.text").font(.callout).foregroundStyle(.secondary)
            Text(name).font(.callout).fontWeight(.medium).lineLimit(1)
        }
    }
}

extension View {
    func cardBackground() -> some View {
        self
            .background(.background, in: RoundedRectangle(cornerRadius: 12))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(.quaternary, lineWidth: 1))
    }
}
