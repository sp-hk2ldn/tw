//
//  DashboardViewModel.swift
//  qn
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation
import Combine

class DashboardViewModel {
    
    var reportService: ReportServiceProtocol
    
    init(reportService: ReportServiceProtocol) {
        self.reportService = reportService
    }
    
    func getReport() {
        reportService.getCreditReport { (res) in
            print(res)
        }
    }
}
