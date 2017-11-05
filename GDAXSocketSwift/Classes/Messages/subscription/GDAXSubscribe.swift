//
//  GDAXSubscribe.swift
//  GDAXSocketSwift
//
//  Created by Hani Shabsigh on 10/28/17.
//  Copyright © 2017 Hani Shabsigh. All rights reserved.
//

import Foundation

public class GDAXSubscribe: GDAXSubscriptionMessage, JSONConvertible {
    
    public func asJSON() -> [String : Any] {
        return subscribeJSON(type: .subscribe, channels: self.channels, productIds: self.productIds)
    }
}
