//
//  ViewController.swift
//  stockTrack
//
//  Created by Luis Adrian on 4/27/22.
//

import UIKit


//API Caller

//UI to Show different stocks

//MVVM
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(StockTableViewCell.self, forCellReuseIdentifier: StockTableViewCell.identifier)
        return tableView
    }()
    
    private var viewModels = [StockTableViewCellViewModel]()
    
    static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stocks"
        view.addSubview(tableView)
        tableView.dataSource  = self
        tableView.delegate = self
        
        APICaller.shared.getAllData { [weak self]result in
            switch result {
            case .success(let models):
                self?.viewModels  = models.compactMap({
                    //Numder formatter
                    let price = "$" + ($0.close ?? "N/A")
                    
                    return StockTableViewCellViewModel(name: $0.name ?? "N/A", ticker: $0.symbol ?? "" , price: price)
                })
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    //Tableview
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StockTableViewCell.identifier, for: indexPath) as? StockTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

