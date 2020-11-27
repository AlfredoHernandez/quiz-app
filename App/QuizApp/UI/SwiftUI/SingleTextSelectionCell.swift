//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftUI

struct SingleTextSelectionCell: View {
    let option: String
    let selection: () -> Void

    var body: some View {
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
}

struct SingleTextSelectionCell_Previews: PreviewProvider {
    static var previews: some View {
        SingleTextSelectionCell(option: "An option cell", selection: {})
            .previewLayout(.sizeThatFits)
    }
}
