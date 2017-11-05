//
//  ViewController.swift
//  GDAXSocketSwift
//
//  Created by Hani Shabsigh on 11/02/2017.
//  Copyright (c) 2017 Hani Shabsigh. All rights reserved.
//

import UIKit
import GDAXSocketSwift

class ViewController: UIViewController {

    var socketClient: GDAXSocketClient = GDAXSocketClient()
    let priceFormatter: NumberFormatter = NumberFormatter()
    let timeFormatter: DateFormatter = DateFormatter()
    
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productIdLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socketClient.delegate = self
        socketClient.webSocket = ExampleWebSocketClient(url: URL(string: GDAXSocketClient.baseAPIURLString)!)
        socketClient.logger = GDAXSocketClientDefaultLogger()
        
        priceFormatter.numberStyle = .decimal
        priceFormatter.maximumFractionDigits = 2
        priceFormatter.minimumFractionDigits = 2
        
        timeFormatter.dateStyle = .short
        timeFormatter.timeStyle = .medium
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !socketClient.isConnected {
            socketClient.connect()
        }
    }
}

extension ViewController: GDAXSocketClientDelegate {
    func gdaxSocketDidConnect(socket: GDAXSocketClient) {
        socket.subscribe(channels:[.ticker], productIds:[.BTCUSD])
    }
    
    func gdaxSocketDidDisconnect(socket: GDAXSocketClient, error: Error?) {
        
    }
    
    func gdaxSocketClientOnErrorMessage(socket: GDAXSocketClient, error: GDAXErrorMessage) {
        print(error.message)
    }
    
    func gdaxSocketClientOnTicker(socket: GDAXSocketClient, ticker: GDAXTicker) {
        let formattedPrice = priceFormatter.string(from: ticker.price as NSNumber) ?? "0.0000"
        self.tickerLabel.text = ticker.type.rawValue
        self.priceLabel.text = "Price = " + formattedPrice
        self.productIdLabel.text = ticker.productId.rawValue
        
        if let time = ticker.time {
            self.timeLabel.text = timeFormatter.string(from: time)
        } else {
            self.timeLabel.text = timeFormatter.string(from: Date())
        }
    }
}
