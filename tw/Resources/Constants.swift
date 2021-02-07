//
//  Constants.swift
//  tw
//
//  Created by Stephen Parker on 5/2/2021.
//

import Foundation

final class Constants {
    static let shared = Constants()
    // MARK: Localized descriptions of errors
    let notFoundFailure = "The operation couldn’t be completed. (tw.APIError error 2.)"
    let internetFailure = "The Internet connection appears to be offline."
    let decodeFailure = "The data couldn’t be read because it isn’t in the correct format."
    let unexpectedData = "The data couldn’t be read because it is missing."
    // MARK: Errors shown to the user
    let messageInvalidUser = "Error: Please enter a valid username"
    // MARK: User default key(s)
    let usernameKey = "currentUser"
    // MARK: Don't allow other initialisations of this class
    private init() {}
}
