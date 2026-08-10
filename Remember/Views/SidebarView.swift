import SwiftUI

struct SidebarView: View {
    @Binding var section: SidebarSection
    var footerText: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("REMEMBER")
                .font(.caption).fontWeight(.semibold)
                .foregroundStyle(.secondary).tracking(1.2)
                .padding(.horizontal, 12).padding(.bottom, 8)

            Button { section = .ask } label: {
                SidebarItem(icon: "magnifyingglass", title: "Perguntar", isActive: section == .ask)
            }
            .buttonStyle(.plain)

            Button { section = .myNotes } label: {
                SidebarItem(icon: "doc.text", title: "Minhas Notas", isActive: section == .myNotes)
            }
            .buttonStyle(.plain)

            Spacer()

            if !footerText.isEmpty {
                HStack(spacing: 6) {
                    Circle().fill(.secondary).frame(width: 6, height: 6)
                    Text(footerText).font(.callout).foregroundStyle(.secondary).lineLimit(1)
                }
                .padding(.horizontal, 12).padding(.vertical, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.quaternary.opacity(0.5), in: RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal, 8)
            }
        }
        .padding(.vertical, 16).padding(.horizontal, 8)
    }
}
