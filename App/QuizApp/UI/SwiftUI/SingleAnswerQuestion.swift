//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftUI

struct SingleAnswerQuestion: View {
    let title: String
    let question: String
    let options: [String]
    let selection: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            QuestionHeader(title: title, question: question)
            ForEach(options, id: \.self) { option in
                Button(action: {}) {
                    HStack {
                        Circle()
                            .stroke(Color.secondary, lineWidth: 2.5)
                            .frame(width: 40, height: 40)
                        Text(option)
                            .font(.title)
                            .foregroundColor(.secondary)
                        Spacer()
                    }.padding()
                }
            }
            Spacer()
        }
    }
}

struct SingleAnswerQuestion_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SingleAnswerQuestion(
                title: "1 of 2",
                question: "What is Alfredo's nationality?",
                options: ["Canadian", "Mexican", "Greek", "British"],
                selection: { _ in }
            )
            SingleAnswerQuestion(
                title: "1 of 2",
                question: "What is Alfredo's nationality?",
                options: ["Canadian", "Mexican", "Greek", "British"],
                selection: { _ in }
            ).preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
