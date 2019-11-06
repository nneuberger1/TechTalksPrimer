//
//  ChartService.swift
//  TechTalksPrimer
//
//  Created by Nicholas Neuberger on 11/3/19.
//  Copyright © 2019 Nicholas Neuberger. All rights reserved.
//

import Foundation
import Alamofire

typealias FetchChartsCallback = (ChartSupplement?, AFError?) -> ()


enum ChartServiceError: Error {
    case invalidUrl
}

class ChartService {
    
    func fetchCharts(useCachedData:Bool, callback:@escaping FetchChartsCallback) {
        
        let persistedChartSupplement = ChartSupplement.loadData()
        
        if useCachedData,
            let persistedChartSupplement = persistedChartSupplement {
            
            callback(persistedChartSupplement, nil)
            return
        }

        guard let url = URL(string: "https://soa.smext.faa.gov/apra/supplement/chart?edition=current&volume=NORTH%20CENTRAL") else {
            callback(nil, AFError.createURLRequestFailed(error: ChartServiceError.invalidUrl))
            return
        }

        let headers:HTTPHeaders = [.accept("application/json")]

        AF.request(url,
                        method: .get,
                        parameters: ["edition": "current"],
                        headers: headers)
        .validate()
        .responseJSON { response in

            switch response.result {
            case .success(let any):

                print("any object returned: \(any)")
                
                guard let data = response.data else {
                    print("data not parsed for chart supplement")
                    return
                }
                
                // DEMO below is using base decoding of objects via NSData.  Alamofire does have custom Response Handlers that can be implemented, but below is easy and clear.
                //      alternative Handlers: https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md#introduction
                
                guard let chartSupplement = try? JSONDecoder().decode(ChartSupplement.self, from: data) else {
                    print("data not parsed for chart supplement")
                    return
                }
                
            //            print("chartSupplement is: \(chartSupplement)")
                
                if useCachedData {
                    chartSupplement.storeToDefaults()
                }
                
                callback(chartSupplement, nil)

            case .failure(let error):
                print("error occurred: \(error.localizedDescription)")
                callback(nil, error)
            }
        }
    }
}
