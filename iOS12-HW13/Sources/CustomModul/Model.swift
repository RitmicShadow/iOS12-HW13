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

extension Section {
    static var options: [Section] = [
        Section(options: [
            .swithCell(model: SettingsSwithOption(
                title: "Авиарежим",
                icon: UIImage(systemName: "airplane"),
                iconBackgroundColor: .systemOrange,
                isOn: true
            ){
                print("Swith")
            }),
            .staticCell(model: SettingsOption(
                title: "Wi-Fi",
                icon: UIImage(systemName: "wifi"),
                iconBackgroundColor: .systemBlue
            ){
                print("Tapped Wi-Fi")
            }),
            .staticCell(model: SettingsOption(
                title: "Bluetooth",
                icon: UIImage(named: "bluetooth")?.withTintColor(.white),
                iconBackgroundColor: .systemBlue
            ){
                print("Tapped Bluetooth")
            }),
            .staticCell(model: SettingsOption(
                title: "Сотовая связь",
                icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                iconBackgroundColor: .systemGreen
            ){
                print("Tapped Сотовая связь")
            }),
            .staticCell(model: SettingsOption(
                title: "Режим модема",
                icon: UIImage(systemName: "personalhotspot"),
                iconBackgroundColor: .systemGreen
            ){
                print("Tapped Режим модема")
            }),
            .swithCell(model: SettingsSwithOption(
                title: "VPN",
                icon: UIImage(named: "vpn")?.withTintColor(.white),
                iconBackgroundColor: .systemBlue,
                isOn: false
            ){
                print("Swith")
            })
        ]),
        Section(options: [
            .staticCell(model: SettingsOption(
                title: "Уведомления",
                icon: UIImage(systemName: "bell.badge.fill"),
                iconBackgroundColor: .systemRed
            ){
                print("Tapped Уведомления")
            }),
            .staticCell(model: SettingsOption(
                title: "Звуки, тактильные сигналы",
                icon: UIImage(systemName: "speaker.wave.3.fill"),
                iconBackgroundColor: .systemRed
            ){
                print("Tapped Звуки, тактильные сигналы")
            }),
            .staticCell(model: SettingsOption(
                title: "Не беспокоить",
                icon: UIImage(systemName: "moon.fill"),
                iconBackgroundColor: .systemIndigo
            ){
                print("Tapped Не беспокоить")
            }),
            .staticCell(model: SettingsOption(
                title: "Экранное время",
                icon: UIImage(systemName: "hourglass"),
                iconBackgroundColor: .systemIndigo
            ){
                print("Tapped Экранное время")
            })
        ]),
        Section(options: [
            .staticCell(model: SettingsOption(
                title: "Основные",
                icon: UIImage(systemName: "gear"),
                iconBackgroundColor: .systemGray
            ){
                print("Tapped Основные")
            }),
            .staticCell(model: SettingsOption(
                title: "Пункт управления",
                icon: UIImage(named: "switch"),
                iconBackgroundColor: .systemGray4
            ){
                print("Tapped Пункт управления")
            }),
            .staticCell(model: SettingsOption(
                title: "Экран и яркость",
                icon: UIImage(systemName: "sun.max.fill"),
                iconBackgroundColor: .systemBlue
            ){
                print("Tapped Экран и яркость")
            }),
            .staticCell(model: SettingsOption(
                title: "Экран <<Домой>>",
                icon: UIImage(named: "launchpad"),
                iconBackgroundColor: .systemIndigo
            ){
                print("Tapped <<Домой>>")
            }),
            .staticCell(model: SettingsOption(
                title: "Универсальный доступ",
                icon: UIImage(systemName: "figure.wave.circle"),
                iconBackgroundColor: .systemBlue
            ){
                print("Tapped Универсальный доступ")
            }),
            .staticCell(model: SettingsOption(
                title: "Обои",
                icon: UIImage(named: "wallpaper")?.withTintColor(.white),
                iconBackgroundColor: UIColor(red: 100 / 250,
                                             green: 210 / 250,
                                             blue: 255 / 250,
                                             alpha: 1)
            ){
                print("Tapped Обои")
            }),
            .staticCell(model: SettingsOption(
                title: "Siri и Поиск",
                icon: UIImage(named: "siri"),
                iconBackgroundColor: .systemCyan
            ){
                print("Tapped Siri и Поиск")
            }),
            .staticCell(model: SettingsOption(
                title: "Face ID и код - пароль",
                icon: UIImage(systemName: "faceid"),
                iconBackgroundColor: .systemGreen
            ){
                print("Tapped Face ID и код-пароль")
            }),
            .staticCell(model: SettingsOption(
                title: "Экстренный вызов - SOS",
                icon: UIImage(systemName: "sos"),
                iconBackgroundColor: .systemRed
            ){
                print("Tapped Обои")
            })
        ])
    ]
}
