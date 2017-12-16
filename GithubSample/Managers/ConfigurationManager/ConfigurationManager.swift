//
//  ConfigurationManager.swift
//  GithubSample
//
//  Created by Rajan Maheshwari on 16/12/17.
//  Copyright © 2017 Rajan Maheshwari. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {

    fileprivate enum AppEnvironment: String {
        case development = "Development"
        case production = "Production"
    }
    
    //Endpoints/Keys needed in our application
    fileprivate struct AppConfiguration {
        var apiEndPoint: String
        var analyticsKey: String
        var loggingEnabled: Bool
        var trackingEnabled: Bool
        var environment: AppEnvironment
    }
    
    fileprivate var activeConfiguration: AppConfiguration!
    
    
    // MARK: - Singleton Instance
    private static let _shared = ConfigurationManager()
    
    class func shared() -> ConfigurationManager {
        return _shared
    }
    
    private override init() {
        super.init()
        
        // Load application selected environment and its configuration
        if let environment = self.currentEnvironment() {
            
            self.activeConfiguration = self.configuration(environment: environment)
            
            if self.activeConfiguration == nil {
                assertionFailure(NSLocalizedString("Unable to load application configuration", comment: "Unable to load application configuration"))
            }
        } else {
            assertionFailure(NSLocalizedString("Unable to load application flags", comment: "Unable to load application flags"))
        }
    }
    
    private func currentEnvironment() -> AppEnvironment? {
        
        #if DEBUG
            return AppEnvironment.development
        #else
            return AppEnvironment.production
        #endif
    }
    
    /**
     Returns application active configuration
     
     - parameter environment: An application selected environment
     
     - returns: An application configuration structure based on selected environment
     */
    private func configuration(environment: AppEnvironment) -> AppConfiguration {
        
        switch environment {
        case .development:
            return debugConfiguration()
        case .production:
            return productionConfiguration()
        }
    }
    
    private func debugConfiguration() -> AppConfiguration {
        
        return AppConfiguration(apiEndPoint: "https://api.github.com/",
                                analyticsKey: "",
                                loggingEnabled: true,
                                trackingEnabled: false,
                                environment: .development
        )
    }
    
    private func productionConfiguration() -> AppConfiguration {
        
        return AppConfiguration(apiEndPoint: "api/release",
                                analyticsKey: "",
                                loggingEnabled: false,
                                trackingEnabled: false,
                                environment: .production
        )

    }
}

extension ConfigurationManager {
    
    // MARK: - Public Methods
    
    func applicationEnvironment() -> String {
        return self.activeConfiguration.environment.rawValue
    }
    
    func applicationEndPoint() -> String {
        return self.activeConfiguration.apiEndPoint
    }
    
    func loggingEnabled() -> Bool {
        return self.activeConfiguration.loggingEnabled
    }
    
    func analyticsKey() -> String {
        return self.activeConfiguration.analyticsKey
    }
    
    func trackingEnabled() -> Bool {
        return self.activeConfiguration.trackingEnabled
    }
}

