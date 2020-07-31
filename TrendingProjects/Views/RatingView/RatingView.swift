//
//  RatingView.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/31/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit

class RatingView: UIView {

    @IBOutlet private(set) weak var contentView: UIView!
    
    @IBOutlet private(set) weak var starsView: RatingItemView!
    @IBOutlet private(set) weak var forksView: RatingItemView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(RatingView.identifier, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        setupViews()
    }
    
    private func setupViews() {
        contentView.layer.borderColor = UIColor.borderColor.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 4
    }

}

//MARK: - RatingViewContigurable
extension RatingView: RatingViewContigurable {
    
    func configure(with content: RatingViewContent) {
        
       
        starsView.configure(with: RatingItemViewData(title: "\(content.starsCount.description) \(Strings.stars.rawValue)", icon: UIImage(systemName: "star.fill")))
        
        forksView.configure(with: RatingItemViewData(title: "\(content.forksCount.description) \(Strings.forks.rawValue)", icon: UIImage(systemName: "dots.fill")))
        
    }
    
}
