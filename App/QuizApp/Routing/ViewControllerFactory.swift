//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import QuizEngine
import UIKit

protocol ViewControllerFactory {
    typealias Answers = [(question: Question<String>, answer: [String])]

    func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController

    func resultsViewController(for userAnswers: Answers) -> UIViewController
}
