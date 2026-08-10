//
//  MainView.swift
//  Remember
//
//  Created by Natali Queiróz on 10/08/26.
//

import SwiftUI

struct MainView: View {

    let notes: [Note]
    let vaultName: String
    
    private let languageModel = LanguageModelService()

    var body: some View {

        HStack {

            VStack(alignment: .leading) {

                Text("REMEMBER")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                Divider()

                Text("Perguntar")
                    .font(.headline)

                Text("Minhas Notas")
                    .font(.headline)

                Spacer()

                Text(vaultName)
                    .foregroundStyle(.secondary)

            }
            .frame(width: 220)

            Divider()

            VStack(alignment: .leading) {

                Text("Minhas Notas")
                    .font(.largeTitle)

                Text("\(notes.count) notas importadas")
                    .foregroundStyle(.secondary)

                List(notes) { note in

                    VStack(alignment: .leading) {

                        Text(note.title)
                            .font(.headline)

                        Text(note.url.lastPathComponent)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                    }

                }

            }
            .padding()
            
        }
        .task {

            await languageModel.test()

        }
    }

}

#Preview {

    MainView(
        notes: [],
        vaultName: "TesteVault"
    )

}
