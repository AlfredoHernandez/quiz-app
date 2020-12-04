//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftUI

struct RoundedButton: View {
    let title: String
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                Text(title)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
            }
            .background(Color.blue)
            .cornerRadius(25)
        })
            .buttonStyle(PlainButtonStyle())
            .disabled(!isEnabled)
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoundedButton(title: "A title", isEnabled: true, action: {})
                .previewLayout(.sizeThatFits)
            RoundedButton(title: "A title", isEnabled: false, action: {})
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
