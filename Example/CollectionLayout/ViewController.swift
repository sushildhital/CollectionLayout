//
//  ViewController.swift
//  CollectionLayout
//
//  Created by sushildhital on 06/20/2022.
//  Copyright (c) 2022 sushildhital. All rights reserved.
//

import UIKit
import CollectionLayout

class ViewController: UIViewController {
    
    var bounds = UIScreen.main.bounds.width
    
    var colors: [UIColor] = [UIColor.red, UIColor.green, UIColor.blue, UIColor.purple, UIColor.orange, UIColor.black, UIColor.cyan]
    
    var cellIdentifier = "cell"
        
    lazy var collectionView: UICollectionView = {
        
        let layout = CollectionLayout()
        
        let width = (3 / 4) * bounds
        
        let sectionSpace = (1 / 8) * bounds
        
        let cellSpace = (1 / 16) * bounds
        
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: sectionSpace, bottom: 0, right: sectionSpace)
        
        layout.itemSize = CGSize(width: width, height: width)
        
        layout.minimumLineSpacing = cellSpace
                
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.decelerationRate = .zero
        
        collectionView.dataSource = self
        
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
                
        self.view.backgroundColor = .white
        
        self.registerUICollectionViewCells()
        
        self.setupLayout()
                
    }
    
    private func registerUICollectionViewCells() {
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        self.collectionView.delegate = self
        
        self.collectionView.dataSource = self
                
    }
    
}

extension ViewController {
    
    func setupLayout(){
        
        self.setuplayoutForCollectionView()
        
    }
    
    func setuplayoutForCollectionView(){
        
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
        
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: (3 / 4) * bounds),
            
        ])
        
    }
    
}

// MARK: - CollectionView Data Source

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return colors.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        let color = colors[indexPath.item]
        
        cell.backgroundColor = color
        
        return cell
        
    }
    
}
