import SwiftUI

struct SidebarItem: View {
    let icon: String
    let title: String
    let isActive: Bool

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
            Text(title)
            Spacer()
        }
        .font(.body)
        .foregroundStyle(isActive ? .primary : .secondary)
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            isActive ? AnyShapeStyle(.quaternary) : AnyShapeStyle(.clear),
            in: RoundedRectangle(cornerRadius: 8)
        )
        .contentShape(Rectangle())
    }
}
