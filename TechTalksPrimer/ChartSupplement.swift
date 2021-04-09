

// DEMO:  This class was generated using https://app.quicktype.io/ to quickly build out a Swift object based on a JSON data structure


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let chartSupplement = try? newJSONDecoder().decode(ChartSupplement.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseChartSupplement { response in
//     if let chartSupplement = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - ChartSupplement
struct ChartSupplement: Codable {
    let status: Status
    let edition: [Edition]
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseEdition { response in
//     if let edition = response.result.value {
//       ...
//     }
//   }

// MARK: - Edition
struct Edition: Codable {
    let geoname: Geoname
    let editionName: EditionName
    let format: Format
    let volume: Volume
    let editionDate: String
    let editionNumber: Int
    let product: Product
}

//enum EditionDate: String, Codable {
//    case the10102019 = "10/10/2019"
//}

enum EditionName: String, Codable {
    case current = "CURRENT"
}

enum Format: String, Codable {
    case pdf = "PDF"
}

enum Geoname: String, Codable {
    case iowa = "IOWA"
    case kansas = "KANSAS"
    case minnesota = "MINNESOTA"
    case missouri = "MISSOURI"
    case nebraska = "NEBRASKA"
    case northDakota = "NORTH DAKOTA"
    case southDakota = "SOUTH DAKOTA"
    
    
    func toString() -> String {
        return self.rawValue
    }

}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseProduct { response in
//     if let product = response.result.value {
//       ...
//     }
//   }

// MARK: - Product
struct Product: Codable {
    let productName: ProductName
    let url: String
}

enum ProductName: String, Codable {
    case supplement = "SUPPLEMENT"
}

enum Volume: String, Codable {
    case nc = "NC"
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStatus { response in
//     if let status = response.result.value {
//       ...
//     }
//   }

// MARK: - Status
struct Status: Codable {
    let code: Int
    let message: String
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers

//extension DataRequest {
//    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer {
//        return DataResponseSerializer { _, response, data, error in
//            guard error == nil else { return .failure(error!) }
//
//            guard let data = data else {
//                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
//            }
//
//            return Result { try newJSONDecoder().decode(T.self, from: data) }
//        }
//    }
//
//    @discardableResult
//    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
//        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
//    }
//
//    @discardableResult
//    func responseChartSupplement(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<ChartSupplement>) -> Void) -> Self {
//        return responseDecodable(queue: queue, completionHandler: completionHandler)
//    }
//}
