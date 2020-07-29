//
//  ServiceManager.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/29/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import Foundation

protocol MappableResponse {
    init(data: Data) throws
}

class ServiceManager<Response: MappableResponse> {
    
    typealias ResponseObject = Response
    
    private let service: Endpoint
    private let session: NetworkSession
    private let httpService: HTTPRequestSession
    
    private var onSuccessCallback: ServiceSuccessCallback?
    private var onFailureCallback: ServiceFailureCallback?
    
    init(session: NetworkSession = URLSession.shared, _ service: Endpoint) {
        self.session = session
        self.service = service
        self.httpService = HTTPSession(session: session)
    }
    
    @discardableResult
    convenience init(session: NetworkSession = URLSession.shared, _ service: Endpoint, onSuccess: @escaping ServiceSuccessCallback, onFailure: @escaping ServiceFailureCallback) {
        
        self.init(session: session, service)
        onSuccessCallback = onSuccess
        onFailureCallback = onFailure
        
        call()
    }
    
}

extension ServiceManager {
    
    private func call() {
       
        let request = HTTPServiceRequest(endpoint: service)
        
        httpService.request(request) { (data, response, error) in
         
            if let error = error {
                self.onFailureCallback?(error)
                return
            }
            
            guard let response = response else {
                self.onFailureCallback?(NetworkError.responseIsNil)
                return
            }
            
            guard let data = data else {
                self.onFailureCallback?(NetworkError.responseDataIsNil)
                return
            }
            
            do {
                
                try self.validateResponse(response, data: data)
                
                let mapped = try Response(data: data)
                self.onSuccessCallback?(mapped)
            } catch {
                self.onFailureCallback?(error)
            }
            
        }
    }
    
    private func validateResponse( _ response: URLResponse, data: Data) throws {
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw NetworkError.invalidStatusCode
        }
        switch statusCode {
        case 200:
            return
        default:
            throw NetworkError.responseError(statusCode: statusCode, response: response)
        }
    }
    
}

//MARK: - HTTPManagerService functions
extension ServiceManager: HTTPManagerService {
    
    func onSuccess(_ callback: @escaping ServiceSuccessCallback) -> Self {
        onSuccessCallback = callback
        return self
    }
    
    func onFail(_ callback: @escaping ServiceFailureCallback) -> Self {
        onFailureCallback = callback
        return self
    }
    
}
