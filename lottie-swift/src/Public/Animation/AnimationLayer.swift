//
//  AnimationLayer.swift
//  Lottie
//
//  Created by Almin Milanovic on 15/01/2020.
//  Copyright © 2020 YurtvilleProds. All rights reserved.
//

import Foundation
import QuartzCore

public protocol AnimationLayer {
    func compSize() -> CGSize
    func display(with procress: CGFloat)
}
extension CALayer: AnimationLayer {
    @objc public static func animation(withName name: String) -> CALayer {
        return AnimationContainer.layer(animation: Animation.named(name)!, imageProvider: nil)
    }
    @objc public static func animation(withPath path: String) -> CALayer {
        return AnimationContainer.layer(animation: Animation.filepath(path)!, imageProvider: nil)
    }
    @objc public func compSize() -> CGSize {
        return .zero
    }
    @objc public func display(with procress: CGFloat) { }
    
    @objc public static func getDuration(fromPath path: String) -> Double {
        return Animation.filepath(path)?.duration ?? 0
    }
    
    @objc public static func getCompSize(fromPath path: String) -> CGSize {
        return CALayer.animation(withPath: path).compSize()
    }
}
