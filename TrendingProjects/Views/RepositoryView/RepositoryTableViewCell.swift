//
//  RepositoryTableViewCell.swift
//  TrendingProjects
//
//  Created by Salome Tsiramua on 7/30/20.
//  Copyright © 2020 Salome Tsiramua. All rights reserved.
//

import UIKit

protocol RepositoryTableViewCellConfigurable {
    
    func configure(with content: RepositoryContent)
}

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var projectName: UILabel!
    @IBOutlet private weak var projectStarsCount: UILabel!
    @IBOutlet private weak var projectDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

//MARK: - RepositoryTableViewCellConfigurable
extension RepositoryTableViewCell: RepositoryTableViewCellConfigurable {
    
    func configure(with content: RepositoryContent) {
        projectName.text = content.name
        projectStarsCount.text = content.stars.description
        projectDescription.text = content.description
    }
    
}
