//
//  CustomComponents.swift
//  ChargerApp
//
//  Created by Aleyna Mandacı on 13.07.2022.
//

import UIKit

func customTextField (string : String, color : UIColor) -> NSAttributedString {
    let placeholderTextColor = NSAttributedString(string: string,
                                                attributes: [NSAttributedString.Key.foregroundColor: color])
    return placeholderTextColor
}

func backgroundColor (view : UIView) {
    let layer = CAGradientLayer()
    layer.frame = view.bounds
    layer.colors = [charcoalGray.cgColor , dark.cgColor]
    layer.startPoint = CGPoint(x: 0,y: 0)
    layer.endPoint = CGPoint(x: 1,y: 1)
    view.layer.insertSublayer(layer, at: 0)
}

func profileView (view : UIView) {
    view.layer.cornerRadius = 10
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 3, height: 3)
    view.layer.shadowOpacity = 0.7
    view.layer.shadowRadius = 4.0
}

func searchBar (view : UIView) {
    view.layer.cornerRadius = 15
}
