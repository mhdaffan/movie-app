//
//  NetworkInjectionKey.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

struct NetworkSessionInjectionKey: InjectionKey {
    static var currentValue: NetworkSession = NetworkSessionImpl()
}

struct NetworkServiceInjectionKey: InjectionKey {
    static var currentValue: NetworkService = NetworkServiceImpl()
}

struct DataTransferServiceInjectionKey: InjectionKey {
    static var currentValue: DataTransferService = DataTransferServiceImpl()
}

struct NetworkConfigurationInjectionKey: InjectionKey {
    static var currentValue: NetworkConfigurable = NetworkConfiguration(
        baseURL: "https://itunes.apple.com",
        headers: [
            "Content-Type": "application/json"
        ]
    )
}

extension InjectedValue {

    var networkConfiguration: NetworkConfigurable {
        get { Self[NetworkConfigurationInjectionKey.self] }
        set { Self[NetworkConfigurationInjectionKey.self] = newValue }
    }
    
    var networkSession: NetworkSession {
        get { Self[NetworkSessionInjectionKey.self] }
        set { Self[NetworkSessionInjectionKey.self] = newValue }
    }
    
    var networkService: NetworkService {
        get { Self[NetworkServiceInjectionKey.self] }
        set { Self[NetworkServiceInjectionKey.self] = newValue }
    }
    
    var dataTransferService: DataTransferService {
        get { Self[DataTransferServiceInjectionKey.self] }
        set { Self[DataTransferServiceInjectionKey.self] = newValue }
    }
    
}
