//
//  DashboardViewController.swift
//  qn
//
//  Created by Stephen Parker on 30/1/2021.
//

import UIKit
import Combine

final class DashboardViewController: UIViewController, Storyboarded {
    var viewModel: DashboardViewModel?
    
    @IBOutlet weak var maxScoreLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var chartView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        viewModel?.getAccount(completion: { [weak self] (error) in
            if error != nil {
                self?.showAlert(with: error!)
            } else {
                guard let viewModel = self?.viewModel else {
                    fatalError("No ViewModel")
                }
                if let creditScore = viewModel.creditScore, let maxCreditScore = viewModel.maxCreditScore {
                    self?.scoreLabel.text = String(creditScore)
                    self?.maxScoreLabel.text = "out of \(maxCreditScore)"
                    self?.setupChart(creditScore: creditScore, maxCreditScore: maxCreditScore)
                } else {
                    self?.showAlert(with: .generic)
                }
                
            }
        })
        
    }
    
    func setupChart(creditScore: Int, maxCreditScore: Int) {
        let donutChart = DonutChartView(frame: chartView.frame)
        donutChart.creditScore = creditScore
        donutChart.maxCreditScore = maxCreditScore
        donutChart.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(donutChart)
        let constraints = [
            donutChart.centerXAnchor.constraint(equalTo: chartView.centerXAnchor),
            donutChart.centerYAnchor.constraint(equalTo: chartView.centerYAnchor),
            donutChart.widthAnchor.constraint(equalTo: chartView.widthAnchor),
            donutChart.heightAnchor.constraint(equalTo: chartView.heightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
