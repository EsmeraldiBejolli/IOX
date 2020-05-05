//
//  TableViewCell.swift
//  IOX
//
//  Created by Esmeraldi Bejolli on 04/05/2020.
//  Copyright © 2020 ebejolli. All rights reserved.
//

import UIKit

struct Task: Decodable {
    var image: String
    var name: String
    var isCompelted: Bool
}

class TaskViewCell: UITableViewCell {

    var isActive: Bool = false
    var task: Task?  {
        willSet {
            titleLabel.text = newValue!.name
        }
    }
    
    init(titleFont: UIFont?) {
        super.init(style: .default, reuseIdentifier: "TaskViewCell")
        titleLabel.font = titleFont ?? UIFont(name: "System", size: 15.1)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private let titleLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "System", size: 15.1)
        return label
    }()
    
    private let stackView: UIStackView = {

        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let taskStatusImage: UIImageView = {
        let _image = UIImage(contentsOfFile: "arrow_check")
        return UIImageView(image: _image)
    }()
    
    private let containerView: UIView = {
       var _view = UIView()
        _view.backgroundColor = .white
        return _view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TaskViewCell")
        stackView.addSubview(titleLabel)
        stackView.addSubview(taskStatusImage)
        containerView.addSubview(stackView)
        addSubview(containerView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
