//
//  Shared.swift
//  ObjectScanner
//
//  Created by Ismail Bozkurt on 14/08/2015.
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Ismail Bozkurt
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import simd
import UIKit


struct OSPoint {
    var point: float4 = float4(0.0);
    var color: float4 = float4(1.0);

    static let origin: OSPoint = OSPoint();

    
    func isValid() -> Bool
    {
        if  self.point.x == OSPoint.origin.point.x &&
            self.point.y == OSPoint.origin.point.y &&
            self.point.z == OSPoint.origin.point.z
        {
            return false;
        }
        return true;
    }
}

struct OSMatch3D {
    var trainPoint: float4
    var queryPoint: float4
    
    init()
    {
        self.queryPoint = float4(0.0, 0.0, 0.0, 1.0);
        self.trainPoint = float4(0.0, 0.0, 0.0, 1.0);
    }
    
    init(queryPoint: float4, trainPoint: float4)
    {
        self.queryPoint = queryPoint;
        self.trainPoint = trainPoint;
    }
//    var trainPoint: Vector4
//    var queryPoint: Vector4
//    
//    init()
//    {
//        self.queryPoint = Vector4(0.0, 0.0, 0.0, 1.0);
//        self.trainPoint = Vector4(0.0, 0.0, 0.0, 1.0);
//    }
//    
//    init(queryPoint: Vector4, trainPoint: Vector4)
//    {
//        self.queryPoint = queryPoint;
//        self.trainPoint = trainPoint;
//    }
}

struct OSMatch{
    var trainPoint: CGPoint;
    var queryPoint: CGPoint;
    
    init()
    {
        trainPoint = CGPointMake(0.0, 0.0);
        queryPoint = CGPointMake(0.0, 0.0);
    }
}