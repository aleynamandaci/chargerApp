//
//  CustomComponents.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 13.07.2022.
//

import UIKit

func customTextField (string : String) -> NSAttributedString {
    let grayPlaceholderText = NSAttributedString(string: string,
                                                attributes: [NSAttributedString.Key.foregroundColor: grayScale])
    return grayPlaceholderText
}

func backgroundColor (view : UIView) {
    let layer = CAGradientLayer()
    layer.frame = view.bounds
    layer.colors = [charcoalGray.cgColor , dark.cgColor]
    layer.startPoint = CGPoint(x: 0,y: 0)
    layer.endPoint = CGPoint(x: 1,y: 1)
    view.layer.insertSublayer(layer, at: 0)
}
