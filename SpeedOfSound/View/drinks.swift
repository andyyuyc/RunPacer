//
//  Drink.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/18.
//
import SwiftUI

struct Drink: Identifiable {
    var id = UUID() .uuidString
    var name: String
    var proportion: Float
    var color: String
    var image: String
}

let drinks = [
    Drink(name: "水", proportion: 1, color: "Color.blue", image: "glass-of-water"),
    Drink(name: "咖啡", proportion: 0.9, color: "color.blue", image:"coffee-cup"),
    Drink(name: "茶", proportion: 0.95, color: "Color.green", image:"green-tea"),
    Drink(name: "運動飲料", proportion: 0.97, color: "color.blue", image:"energy-drink"),
    Drink(name: "可樂", proportion: 0.92, color: "Color.blue", image:"soda-bottle"),
    Drink(name: "牛奶", proportion: 0.87, color: "Color.blue", image: "milk"),
    Drink(name: "果汁", proportion: 0.85, color: "color.blue", image:"juice"),
    Drink(name: "啤酒", proportion: 0.42, color: "Color.green", image:"beer"),
    Drink(name: "可可", proportion: 0.5, color: "color.blue", image:"coco"),
    Drink(name: "葡萄酒", proportion: 0.28, color: "Color.blue", image:"wine"),
]
