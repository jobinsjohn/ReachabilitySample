//
//  ViewController.swift
//  Reachability Sample
//
//  Created by Jobins John on 1/10/18.
//  Copyright © 2018 Jobins John. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var reachabilityObj = MyReachability.networkReachabilityForInternetConnection()
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityDidChange(_:)), name: NSNotification.Name(rawValue: ReachabilityDidChangeNotificationName), object: nil)
        _ = reachabilityObj?.startNotifier()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkReachability()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        reachabilityObj?.stopNotifier()
    }
    
    // MARK: - Methods
    func checkReachability() {
        guard let r =  reachabilityObj else {
            return
        }
        if r.isReachable {
            view.backgroundColor = UIColor.green
        } else {
            view.backgroundColor = UIColor.red
        }
    }
    
    @objc func reachabilityDidChange(_ notification: Notification) {
        checkReachability()
    }
}


