//
//  StockTableViewCell.swift
//  stockTrack
//
//  Created by Luis Adrian on 4/27/22.
//

import UIKit

struct StockTableViewCellViewModel {
    let name, ticker, price: String
}
class StockTableViewCell: UITableViewCell {

    static let identifier = "StockTableViewCell"
    
    //Subview
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    private let tickerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    //Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(tickerLabel)
        contentView.addSubview(priceLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    // Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.sizeToFit()
        priceLabel.sizeToFit()
        tickerLabel.sizeToFit()
        
        nameLabel.frame = CGRect(x: 25, y: 0, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        tickerLabel.frame = CGRect(x: 25, y: contentView.frame.size.height/2, width: contentView.frame.size.width/2, height: contentView.frame.size.height/2)
        priceLabel.frame = CGRect(x: contentView.frame.size.width/2, y: 0, width: (contentView.frame.size.width/2)-15, height: contentView.frame.size.height)
    }
    //Config
    func configure(with viewModel: StockTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.price
        tickerLabel.text = viewModel.ticker
    }
}
