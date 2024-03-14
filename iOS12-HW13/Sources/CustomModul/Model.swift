//
//  Model.swift
//  iOS12-HW13
//
//  Created by Ден Майшев on 11.03.2024.
//

import UIKit

enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case swithCell(model: SettingsSwithOption)
}

struct Section {
    let options: [SettingsOptionType]
}

struct SettingsSwithOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    var isOn: Bool
    let handler: (() -> Void)
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

