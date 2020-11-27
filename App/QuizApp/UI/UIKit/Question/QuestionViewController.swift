//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    private(set) var question = ""
    private(set) var options = [String]()
    private(set) var allowsMultipleSelection = false
    private var selection: (([String]) -> Void)?
    private let reuseIdentifier = "Cell"

    convenience init(question: String, options: [String], allowsMultipleSelection: Bool, selection: @escaping ([String]) -> Void) {
        self.init()
        self.question = question
        self.options = options
        self.allowsMultipleSelection = allowsMultipleSelection
        self.selection = selection
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        headerLabel.text = question
        tableView.allowsMultipleSelection = allowsMultipleSelection
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt _: IndexPath) {
        selection?(selectedOptions(in: tableView))
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt _: IndexPath) {
        if tableView.allowsMultipleSelection {
            selection?(selectedOptions(in: tableView))
        }
    }

    private func selectedOptions(in tableView: UITableView) -> [String] {
        guard let indexPaths = tableView.indexPathsForSelectedRows else { return [] }

        return indexPaths.map { options[$0.row] }
    }
}
