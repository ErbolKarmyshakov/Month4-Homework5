//
//  MakerViewController.swift
//  Month4-Homework5
//
//  Created by Mac User on 8/11/23.
//

import UIKit
class MakerElements{
    static let shared = MakerElements()
    
    func makeLbl(
        text: String = "",
        textColor: UIColor = .black,
        size: CGFloat = 38,
        weight: UIFont.Weight = .bold,
        numberOfLines: Int = 0,
        translatesAutoresizingMaskIntoConstraints: Bool = false,
        textAlignment: NSTextAlignment = .natural
    ) -> UILabel {
        let view = UILabel()
        view.text = text
        view.textColor = textColor
        view.font = .systemFont(ofSize: size, weight: weight)
        view.numberOfLines = numberOfLines
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        view.textAlignment = textAlignment
        return view
    }
    
    func makeView(
        translatesAutoresizingMaskIntoConstraints: Bool = false,
        backgroundColor: UIColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1),
        cornerRadius: CGFloat =  15
    ) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        view.backgroundColor = backgroundColor
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    func makeBtn(
        type: UIButton.ButtonType =  .system,
        color: UIColor = .white,
        title: String = "",
        forB: UIControl.State = .normal,
        cornerRadius: CGFloat = 15,
        backgroundColor: UIColor = UIColor(red: 0.999, green: 0.659, blue: 0, alpha: 1),
        translatesAutoresizingMaskIntoConstraints:Bool = false,
        size: CGFloat = 20,
        weight: UIFont.Weight  =  .bold
    ) -> UIButton {
        let view = UIButton(type: type)
        view.tintColor = color
        view.setTitle(title, for: forB)
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        view.titleLabel?.font = .systemFont(ofSize: size, weight: weight)
        return view
    }
    
    func makeImg(
        name: String,
        translatesAutoresizingMaskIntoConstraints: Bool = false
    ) -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: name)
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return view
    }
    
    func makePusMinusBtn(
        type: UIButton.ButtonType = .system,
        imageBtn: String = "",
        forBtn: UIControl.State = .normal,
        backgroundColor: UIColor = .clear,
        translatesAutoresizingMaskIntoConstraints: Bool = false,
        tintColor: UIColor = UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 1)
    ) -> UIButton {
        let view = UIButton(type: type)
        let btnImg = UIImage(named: imageBtn)
        view.setImage(btnImg, for: forBtn)
        view.backgroundColor = backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        view.tintColor = tintColor
        return view
    }
    
}
