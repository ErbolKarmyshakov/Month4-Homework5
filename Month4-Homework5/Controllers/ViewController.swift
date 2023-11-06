//
//  ViewController.swift
//  Month4-Homework5
//
//  Created by Mac User on 6/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let pizzaLbl = MakerElements.shared.makeLbl(text: "Pizza with \nMushrooms",
                                                        textAlignment: .center
    )
    
    private let pizzaImg = MakerElements.shared.makeImg(name: "pizza")
    
    private let chooseLbl = MakerElements.shared.makeLbl(text: "Choose the size",
                                                         size: 22
    )
    
    private let collect: UICollectionView = {
        let view = UICollectionViewFlowLayout()
        view.itemSize = CGSize(width: 102, height: 38)
        view.scrollDirection = .horizontal
        view.minimumLineSpacing = 46
        view.sectionInset = UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 24)
        let vc = UICollectionView(frame: .zero, collectionViewLayout: view)
        vc.translatesAutoresizingMaskIntoConstraints = false
        vc.backgroundColor = .systemGray6
        return vc
    }()
    
    private let viewBtn = MakerElements.shared.makeView()
    
    private let minusBtn =  MakerElements.shared.makePusMinusBtn(imageBtn: "Minus")
    
    private let countLbl = MakerElements.shared.makeLbl(text: "01",
                                                        textColor: UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 1),
                                                        size: 28
    )
    
    private let plusBtn = MakerElements.shared.makePusMinusBtn(imageBtn: "Plus")
    
    private let priceLbl = MakerElements.shared.makeLbl(text: "Price",
                                                        textColor: UIColor(red: 65/255, green: 65/255, blue: 65/255, alpha: 1),
                                                        size: 14
    )
    
    private let priceCountLbl = MakerElements.shared.makeLbl(text: "$12.00",
                                                             textColor: .green,
                                                             size: 24
    )
    
    private let addBtn = MakerElements.shared.makeBtn(title: "Add to Cart"
    )
    
    var count = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detail"
        view.backgroundColor = .white
        allSetUpConstraints()
    }
    private func allSetUpConstraints(){
        setUpConstraintsForPizzaLbl()
        setUpConstraintsForPizzaImg()
        setUpConstraintsForChooseLbl()
        setUpConstraintsForCollect()
        setUpConstraintsForViewBtn()
        setUpConstraintsForMinusBtn()
        setUpConstraintsForCountLbl()
        setUpConstraintsForPlusBtn()
        minusBtnTapped(minusBtn)
        setUpConstraintsForPriceLbl()
        setUpConstraintsForPriceCountLbl()
        setUpConstraintsForAddBtn()
    }
    private func setUpConstraintsForPizzaLbl(){
        view.addSubview(pizzaLbl)
        NSLayoutConstraint.activate([
            pizzaLbl.topAnchor.constraint(equalTo: view.safeTopAnchor, constant: 56),
            pizzaLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90),
            pizzaLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -90)
        ])
    }
    
    private func setUpConstraintsForPizzaImg(){
        view.addSubview(pizzaImg)
        NSLayoutConstraint.activate([
            pizzaImg.topAnchor.constraint(equalTo: pizzaLbl.bottomAnchor, constant: 36),
            pizzaImg.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setUpConstraintsForChooseLbl(){
        view.addSubview(chooseLbl)
        NSLayoutConstraint.activate([
            chooseLbl.topAnchor.constraint(equalTo: pizzaImg.bottomAnchor, constant: 42),
            chooseLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            chooseLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -126)
        ])
    }
    
    private func setUpConstraintsForCollect(){
        view.addSubview(collect)
        NSLayoutConstraint.activate([
            collect.topAnchor.constraint(equalTo: chooseLbl.bottomAnchor, constant: 42),
            collect.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collect.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collect.heightAnchor.constraint(equalToConstant: 38)
        ])
        collect.dataSource = self
        collect.delegate = self
        collect.register(PizzaCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setUpConstraintsForViewBtn(){
        view.addSubview(viewBtn)
        NSLayoutConstraint.activate([
            viewBtn.topAnchor.constraint(equalTo: collect.bottomAnchor, constant: 56),
            viewBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 97),
            viewBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -97),
            viewBtn.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func setUpConstraintsForMinusBtn(){
        viewBtn.addSubview(minusBtn)
        NSLayoutConstraint.activate([
            minusBtn.topAnchor.constraint(equalTo: viewBtn.topAnchor, constant: 18),
            minusBtn.leadingAnchor.constraint(equalTo: viewBtn.leadingAnchor, constant: 32)
        ])
        minusBtn.addTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
    }
    
    @objc func minusBtnTapped(_ sender: UIButton) {
        if count > 0 {
            count = count - 1
            countLbl.text = formatNumberWithLeadingZero(count)
            updatePriceLabel()
        }
    }
    
    private func setUpConstraintsForCountLbl() {
        viewBtn.addSubview(countLbl)
        NSLayoutConstraint.activate([
            countLbl.topAnchor.constraint(equalTo: viewBtn.topAnchor, constant: 18),
            countLbl.leadingAnchor.constraint(equalTo: minusBtn.trailingAnchor, constant: 34)
        ])
    }
    
    private func setUpConstraintsForPlusBtn(){
        viewBtn.addSubview(plusBtn)
        NSLayoutConstraint.activate([
            plusBtn.topAnchor.constraint(equalTo: viewBtn.topAnchor, constant: 18),
            plusBtn.trailingAnchor.constraint(equalTo: viewBtn.trailingAnchor, constant: -32)
        ])
        plusBtn.addTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
    }
    
    @objc func plusBtnTapped(_ sender: UIButton) {
        count = count + 1
        countLbl.text = formatNumberWithLeadingZero(count)
        updatePriceLabel()
    }
    
    private func updatePriceLabel() {
        let price = count * 12
        priceCountLbl.text = "$\(price).00"
    }
    
    func formatNumberWithLeadingZero(_ number: Int) -> String {
        if number < 10 {
            return "0\(number)"
        } else {
            return "\(number)"
        }
    }
    
    private func setUpConstraintsForPriceLbl(){
        view.addSubview(priceLbl)
        NSLayoutConstraint.activate([
            priceLbl.topAnchor.constraint(equalTo: viewBtn.bottomAnchor, constant: 66),
            priceLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26)
        ])
    }
    
    private func setUpConstraintsForPriceCountLbl(){
        view.addSubview(priceCountLbl)
        NSLayoutConstraint.activate([
            priceCountLbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -38),
            priceCountLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26)
        ])
    }
    
    private func setUpConstraintsForAddBtn(){
        view.addSubview(addBtn)
        NSLayoutConstraint.activate([
            addBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            addBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            addBtn.heightAnchor.constraint(equalToConstant: 61),
            addBtn.widthAnchor.constraint(equalToConstant: 178)
        ])
    }
}

extension  ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)                  as!PizzaCollectionViewCell
        
        cell.layer.cornerRadius = 12
        cell.clipsToBounds = true
        let value = 8 + (indexPath.row * 12)
        cell.initDataCell("\(value) inch")
        return cell
    }
}

extension UIView {
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
}
