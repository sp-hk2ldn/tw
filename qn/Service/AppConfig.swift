//
//  AppConfig.swift
//  qn
//
//  Created by Stephen Parker on 1/2/2021.
//

import Foundation

class AppConfig {
    // swiftlint:disable force_cast
    // swiftlint:disable identifier_name
    ///Uses the environment variables specified in the targets config file
    func baseURL() -> String {
        let rest_protocol = Bundle.main.infoDictionary!["rest_protocol"] as! String
        let host = Bundle.main.infoDictionary!["host"] as! String
        let env = Bundle.main.infoDictionary!["environment"] as! String
        return "\(rest_protocol)\(host)\(env)"
    }
}
