//
// Created by Shaban on 25/06/2021.
//

import UIKit
import Core

public protocol Reportable {

    func showSuccess(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func showError(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func showInfo(
            title: String?,
            message: String?,
            actionTitle: String?,
            actionBlock: (() -> Void)?
    )

    func show(error: Error, title: String)
    func show(error: String, title: String)
}

public extension Reportable {

    func showSuccess(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        showSwiftMessage(
                title: title,
                message: message,
                feedbackType: .success
        )
    }

    func show(error: String, title: String = "") {
        UINotificationFeedbackGenerator().notificationOccurred(.error)
        showError(
                title: title,
                message: error
        )
    }

    func show(error: Error, title: String = "") {
        show(error: error.localizedDescription, title: title)
    }

    func showError(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        AppCrashlytics.record(description: title, failure: message)

        showSwiftMessage(
                title: title,
                message: message,
                actionTitle: actionTitle,
                actionBlock: actionBlock,
                feedbackType: .error
        )
    }

    func showInfo(
            title: String? = nil,
            message: String?,
            actionTitle: String? = nil,
            actionBlock: (() -> Void)? = nil
    ) {
        showSwiftMessage(
                title: title,
                message: message,
                actionTitle: actionTitle,
                actionBlock: actionBlock,
                feedbackType: .warning
        )
    }
}

fileprivate func showSwiftMessage(
        title: String? = nil,
        message: String?,
        actionTitle: String? = nil,
        actionBlock: (() -> Void)? = nil,
        feedbackType: UINotificationFeedbackGenerator.FeedbackType
) {
    // TODO: F, show message

}