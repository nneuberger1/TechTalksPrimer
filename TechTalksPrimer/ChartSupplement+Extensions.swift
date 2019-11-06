import Foundation
import SwifterSwift


/**
 * DEMO: I'm using extensions that aren't in the same file as ChartSupplement.  Since that class is mostly generated using https://app.quicktype.io/
 *
 * Here we implement functionality on top of the classes.
 */



extension ChartSupplement {
    
    public func storeToDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            UserDefaults.standard.set(encoded, forKey: "ChartSupplementKey")
        }
    }
    
    public static func loadData() -> ChartSupplement? {
        if let savedData = UserDefaults.standard.object(forKey: "ChartSupplementKey") as? Data {
            let decoder = JSONDecoder()
            if let loadedChartSupplement = try? decoder.decode(ChartSupplement.self, from: savedData) {
                return loadedChartSupplement
            }
        }
        
        return nil
    }
}

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
