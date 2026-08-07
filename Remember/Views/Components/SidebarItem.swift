import SwiftUI

struct SidebarItem: View {
    let icon: String
    let title: String
    let isActive: Bool

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.body)
                .foregroundStyle(isActive ? .primary : .secondary)
            Text(title)
                .font(.body)
                .foregroundStyle(isActive ? .primary : .secondary)
            Spacer()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            isActive ? AnyShapeStyle(.quaternary) : AnyShapeStyle(.clear),
            in: RoundedRectangle(cornerRadius: 8)
        )
    }
}
