//
//  NetworkDataFeature.swift
//  Axbit test var.4
//
//  Created by 111 on 09.03.2022.
//

import Foundation


class NetworkDataFeature {

    //MARK: - Properties

    let networkService = NetworkService()

    // Method what decode json file into readable format

    func fetchData(urlString: String, response: @escaping (DataModel?) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let generesOrMusicData = try JSONDecoder().decode(DataModel.self, from: data)
                    response(generesOrMusicData)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
