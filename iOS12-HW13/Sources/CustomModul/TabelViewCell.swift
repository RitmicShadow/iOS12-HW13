//
//  TabelViewCell.swift
//  iOS12-HW13
//
//  Created by Ден Майшев on 11.03.2024.
//

import UIKit

class TabelViewCell: UITableViewCell {

    static let identifier = "TabelViewCell"

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconConteiner)
        iconConteiner.addSubview(iconImageView)

        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
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
    }

    public func configure(with model: SettingsOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconConteiner.backgroundColor = model.iconBackgroundColor
    }
}
