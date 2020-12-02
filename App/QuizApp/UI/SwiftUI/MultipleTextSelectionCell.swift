//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import SwiftUI

struct MultipleTextSelectionCell: View {
    @Binding var option: MultipleSelectionOption

    var body: some View {
        Button(action: { option.select() }) {
            HStack {
                Rectangle()
                    .strokeBorder(option.isSelected ? Color.blue : Color.secondary, lineWidth: 2.5)
                    .overlay(
                        Rectangle()
                            .fill(option.isSelected ? Color.blue : .clear)
                            .frame(width: 26, height: 26)
                    )
                    .frame(width: 40, height: 40)
                Text(option.text)
                    .font(.title)
                    .foregroundColor(option.isSelected ? Color.blue : .secondary)
                Spacer()
            }.padding()
        }
    }
}

struct MultipleTextSelectionCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MultipleTextSelectionCell(option: .constant(MultipleSelectionOption(text: "An option cell", isSelected: true)))
                .previewLayout(.sizeThatFits)
            MultipleTextSelectionCell(option: .constant(MultipleSelectionOption(text: "An option cell", isSelected: false)))
                .previewLayout(.sizeThatFits)
        }
    }
}
