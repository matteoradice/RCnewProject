//
//  ViewController.swift
//  RevenueCredits
//
//  Created by Matteo Radice on 20/06/21.
//

import UIKit

class ViewController: UIViewController {

//    let testCompiler: TestCompiler = TestCompiler()
    let simulateRcs: SimulateRcs = SimulateRcs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myRcs1: Float = simulateRcs.calculateWeightedRcs(probabilityOptions: .weighted)
        print(myRcs1)
        let myRcs2: Float = simulateRcs.calculateWeightedRcs(probabilityOptions: .confirmed)
        print(myRcs2)
        let myRcs3: Float = simulateRcs.calculateWeightedRcs(probabilityOptions: .force)
        print(myRcs3)
    
    }


}

