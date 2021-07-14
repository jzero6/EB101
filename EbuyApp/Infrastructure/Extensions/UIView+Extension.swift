//
//  UIView+Extension.swift
//  EbuyApp
//
//  Created by Nana Jimsheleishvili on 13.07.21.
//

import UIKit

extension UIView{
    func setupShadow(UIView: UIView, ViewCornerRadius: CGFloat, shadowOffSet: CGSize, opacity: Float, shadowRadius: CGFloat) {
        UIView.layer.shadowColor = UIColor.black.cgColor
        UIView.layer.shadowOffset = shadowOffSet
        UIView.layer.shadowOpacity = opacity
        UIView.layer.shadowRadius = shadowRadius
        UIView.layer.cornerRadius = ViewCornerRadius
    }
}
