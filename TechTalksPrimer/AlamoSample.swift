////
////  AlamoSample.swift
////  TechTalksPrimer
////
////  Created by Nicholas Neuberger on 11/3/19.
////  Copyright © 2019 Nicholas Neuberger. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//
//struct SupplementChartEdition {
//    let geoname:String
//    let editionName:String
//    let format:String
//    let product
//}
//
///**
// * I found this great example by Ray Wenderlich's site on using Alamo as an alternative to the
// *
// */
//class AlamoSample {
//    
//    // With Alamofire
//    func fetchCharts(completion: @escaping ([RemoteRoom]?) -> Void) {
//      guard let url = URL(string: "https://soa.smext.faa.gov/apra/supplement/chart?edition=current&volume=NORTH%20CENTRAL") else {
//        completion(nil)
//        return
//      }
//        
//        
//      AF.request(url,
//                        method: .get,
//                        parameters: ["include_docs": "true"])
//      .validate()
//      .responseJSON { response in
////        guard response.result.isSuccess else {
////          print("Error while fetching remote rooms: \(String(describing: response.result.error)")
////          completion(nil)
////          return
////        }
////
////        guard let value = response.result.value as? [String: Any],
////          let rows = value["rows"] as? [[String: Any]] else {
////            print("Malformed data received from fetchAllRooms service")
////            completion(nil)
////            return
////        }
//
//        switch response.result {
//        case .success(let any):
//
//
//            
//        case .failure(let error):
//            print("error occurred: \(error.localizedDescription)")
//        }
//        
//        
//        let rooms = rows.flatMap { roomDict in return RemoteRoom(jsonData: roomDict) }
//        completion(rooms)
//      }
//    }
//
//    
//}
//
//
