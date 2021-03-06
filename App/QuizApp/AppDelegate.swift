//
//  Copyright © 2020 Jesús Alfredo Hernández Alarcón. All rights reserved.
//

import QuizEngine
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var quiz: Quiz?
    private lazy var navigationController = UINavigationController()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startNewQuiz()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    private func startNewQuiz() {
        let question1 = Question.singleAnswer("What's Alfredo's nationality?")
        let question2 = Question.multipleAnswer("What are my favorite programming languages?")
        let questions = [question1, question2]

        let option1 = "Canadian"
        let option2 = "Mexican"
        let option3 = "Greek"
        let options1 = [option1, option2, option3]

        let option4 = "C"
        let option5 = "Java"
        let option6 = "Swift"
        let options2 = [option4, option5, option6]

        let options = [question1: options1, question2: options2]
        let correctAnswers = [(question1, [option2]), (question2, [option4, option6])]

        let factory = iOSSwiftUIViewControllerFactory(options: options, correctAnswers: correctAnswers, playAgain: startNewQuiz)
        let router = NavigationControllerRouter(navigationController, factory: factory)

        quiz = Quiz.start(questions: questions, delegate: router)
    }
}
