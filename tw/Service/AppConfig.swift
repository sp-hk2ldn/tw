//
//  AppConfig.swift
//  tw
//
//  Created by Stephen Parker on 1/2/2021.
//

import Foundation

final class AppConfig {
    // swiftlint:disable force_cast
    // swiftlint:disable identifier_name
    ///Uses the environment variables specified in the targets config file
    func baseURL() -> URL {
        let rest_protocol = Bundle.main.infoDictionary!["rest_protocol"] as! String
        let host = Bundle.main.infoDictionary!["host"] as! String
        let env = Bundle.main.infoDictionary!["environment"] as! String
        return URL(string: "\(rest_protocol)\(host)\(env)")!
    }
}
