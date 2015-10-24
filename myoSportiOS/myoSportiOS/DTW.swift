//
//  DTW.swift
//  myoSportiOS
//
//  Created by Gavin Chan on 10/23/15.
//  Copyright © 2015 Gavin Chan. All rights reserved.
//

import UIKit
import Foundation

class DTW {
    
    
    var t1: [Double]!
    var t2: [Double]!

    
    init() {
        print("dtw object born")
    }
    
    
    //math util functions
    func py_dist(x: Double, y: Double) -> Double{
        
        return sqrt(pow((x - y), 2))
    }

    func dtw_distance(t1: [Double], t2: [Double]) -> Double {
        //initialize array with n+m size
        let n = t1.count
        let m = t2.count
//        print(m)
//        print(n)
        
        //create cost matrix
        var cost = Array(count: n, repeatedValue: Array(count: m, repeatedValue: 0.0))
        print(t1)
        print(t2)
        cost[0][0] = py_dist(t1[0], y: t2[0])
        //calc for the first row
        for i in 1...(m-1) {
            cost[i][0] = cost[i-1][0] + py_dist(t1[i], y: t2[0]);
        }
        //calc for the first column
        for j in 1...(n-1) {
            cost[0][j] = cost[0][j-1] + py_dist(t1[0], y: t2[j])
        }
        
        //fill in the rest of the matrix
        for r in 1...n-1 {
            for c in 1...m-1 {
                cost[r][c] = min(cost[r-1][c], min(cost[r][c-1], cost[r-1][c-1])) + py_dist(t1[r], y: t2[c])
            }
        }
        
        return cost[m-1][n-1]
    }

}

