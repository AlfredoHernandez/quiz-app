//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftUI

struct MultipleAnswerQuestion: View {
    let title: String
    let question: String
    @State var store: MultipleSelectionStore

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            HeaderView(title: title, subtitle: question)
            ForEach(store.options.indices) { index in
                MultipleTextSelectionCell(option: $store.options[index])
            }
            Spacer()
            Button(action: store.submit, label: {
                HStack {
                    Spacer()
                    Text("Submit")
                        .padding()
                        .foregroundColor(.white)
                    Spacer()
                }
                .background(Color.blue)
                .cornerRadius(25)
            })
                .buttonStyle(PlainButtonStyle())
                .padding()
                .disabled(!store.canSubmit)
        }
    }
}

struct MultipleAnswerQuestion_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MultipleAnswerQuestionTestView()
            MultipleAnswerQuestionTestView()
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }

    struct MultipleAnswerQuestionTestView: View {
        @State var selection = ["none"]
        var body: some View {
            VStack {
                MultipleAnswerQuestion(
                    title: "1 of 2",
                    question: "What is Alfredo's nationality?",
                    store: .init(options: ["Canadian", "Mexican", "Greek", "British"], handler: { selection = $0 })
                )
                Text("Last submission: " + selection.joined(separator: ","))
            }
        }
    }
}
