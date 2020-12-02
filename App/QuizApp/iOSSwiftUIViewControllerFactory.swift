//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import QuizEngine
import SwiftUI
import UIKit

final class iOSSwiftUIViewControllerFactory: ViewControllerFactory {
    typealias Answers = [(question: Question<String>, answer: [String])]

    private let options: [Question<String>: [String]]
    private let correctAnswers: Answers

    private var questions: [Question<String>] {
        correctAnswers.map(\.question)
    }

    init(options: [Question<String>: [String]], correctAnswers: Answers) {
        self.options = options
        self.correctAnswers = correctAnswers
    }

    func questionViewController(for question: Question<String>, answerCallback: @escaping ([String]) -> Void) -> UIViewController {
        guard let options = self.options[question] else {
            fatalError("Couldn't find options for question: \(question)")
        }

        return questionViewController(for: question, options: options, answerCallback: answerCallback)
    }

    private func questionViewController(
        for question: Question<String>,
        options: [String],
        answerCallback: @escaping ([String]) -> Void
    ) -> UIViewController {
        let presenter = QuestionPresenter(questions: questions, question: question)
        switch question {
        case let .singleAnswer(value):
            return UIHostingController(rootView: SingleAnswerQuestion(
                title: presenter.title,
                question: value,
                options: options,
                selection: { answerCallback([$0]) }
            ))

        case let .multipleAnswer(value):
            return UIHostingController(rootView: MultipleAnswerQuestion(
                title: presenter.title,
                question: value,
                store: .init(options: options, handler: answerCallback)
            ))
        }
    }

    private func questionViewController(
        for question: Question<String>,
        value: String,
        options: [String],
        allowsMultipleSelection: Bool,
        answerCallback: @escaping ([String]) -> Void
    ) -> QuestionViewController {
        let presenter = QuestionPresenter(questions: questions, question: question)
        let controller = QuestionViewController(
            question: value,
            options: options,
            allowsMultipleSelection: allowsMultipleSelection,
            selection: answerCallback
        )
        controller.title = presenter.title
        return controller
    }

    func resultsViewController(for userAnswers: Answers) -> UIViewController {
        let presenter = ResultsPresenter(
            userAnswers: userAnswers,
            correctAnswers: correctAnswers,
            scorer: BasicScore.score
        )
        let controller = ResultsViewController(summary: presenter.summary, answers: presenter.presentableAnswers)
        controller.title = presenter.title
        return controller
    }
}
