//
//  Models.swift
//  stockTrack
//
//  Created by Luis Adrian on 4/27/22.
//

import Foundation

struct Stock: Codable {
    let tickerID, exchangeID, type: Int?
    let secType: [Int]?
    let regionID: Int?
    let regionCode: String?
    let currencyID: Int?
    let name, symbol, disSymbol, disExchangeCode: String?
    let exchangeCode: String?
    let listStatus: Int?
    let template: String?
    let derivativeSupport: Int?
    let tradeTime, status, close, change: String?
    let changeRatio, marketValue, volume, turnoverRate: String?
    let timeZone, tzName, preClose, welcomeOpen: String?
    let high, low, vibrateRatio, avgVol10D: String?
    let avgVol3M, dealAmount, negMarketValue, pe: String?
    let forwardPE, indicatedPE, peTtm, eps: String?
    let epsTtm, pb, totalShares, outstandingShares: String?
    let fiftyTwoWkHigh, fiftyTwoWkLow, yield, currencyCode: String?
    let lotSize, latestDividendDate, latestSplitDate, latestEarningsDate: String?
    let ps, bps, estimateEarningsDate, tradeStatus: String?

}
