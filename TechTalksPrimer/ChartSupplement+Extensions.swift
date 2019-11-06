//
//  ChartSupplement+Extensions.swift
//  TechTalksPrimer
//
//  Created by Nicholas Neuberger on 11/4/19.
//  Copyright © 2019 Nicholas Neuberger. All rights reserved.
//

import Foundation
import SwifterSwift

extension Product {
    
    /**
     * Get's the page number like 217 from:
     * "http://aeronav.faa.gov/afd/10Oct2019/nc_217_10OCT2019.pdf"
     */
    func pageNumber() -> String {
        
        guard let endIndex = self.url.index(of: "_") else { return "" }
        return String(url.suffix(from: endIndex))
    }
}

extension Edition : Equatable {
    
    /**
     * This allows the SwifterSwift removeDuplicates array function to purge duplicate
     * records in the data. No idea why they return duplicate data, but we're gonna filter it.
     *
     * See ChartSupplementVC filterMissouriRecords function
     *
     * Learn more here: https://www.hackingwithswift.com/example-code/language/how-to-conform-to-the-equatable-protocol
     */
    static func == (lhs: Edition, rhs: Edition) -> Bool {
        return lhs.geoname == rhs.geoname &&
            lhs.editionName == rhs.editionName &&
            lhs.product.url == rhs.product.url
    }
}

extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        var indices: [Index] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                indices.append(range.lowerBound)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return indices
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
