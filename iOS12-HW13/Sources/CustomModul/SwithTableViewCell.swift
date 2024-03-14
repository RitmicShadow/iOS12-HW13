//
//  SwithTableViewCell.swift
//  iOS12-HW13
//
//  Created by Ден Майшев on 12.03.2024.
//

import UIKit

class SwithTableViewCell: UITableViewCell {

    static let identifier = "SwithTableViewCell"

    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17)
        return label
    }()

    private lazy var iconConteiner: UIView = {
         let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var mySwith: UISwitch = {
        let mySwith = UISwitch()
        mySwith.onTintColor = .systemBlue
        return mySwith
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconConteiner)
        contentView.addSubview(mySwith)
        iconConteiner.addSubview(iconImageView)

        contentView.clipsToBounds = true
        accessoryType = .none
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconConteiner.frame = CGRect(
            x: 15,
            y: 6,
            width: size,
            height: size
        )

        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2,
            y: (size - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )

        mySwith.sizeToFit()
        mySwith.frame = CGRect(
            x: contentView.frame.size.width - mySwith.frame.size.width - 20,
            y: (contentView.frame.size.height - mySwith.frame.size.height) / 2,
            width: mySwith.frame.size.width,
            height: mySwith.frame.size.height)

        label.frame = CGRect(
            x: 25 + iconConteiner.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 20 - iconConteiner.frame.size.width,
            height: contentView.frame.size.height
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconConteiner.backgroundColor = nil
        mySwith.isOn = false
    }

    public func configure(with model: SettingsSwithOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconConteiner.backgroundColor = model.iconBackgroundColor
        mySwith.isOn = model.isOn
    }
}
