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
    Drink(name: "水", proportion: 1, color: "Color_water", image: "glass"),
    Drink(name: "咖啡", proportion: 0.9, color: "Color_coffee", image:"coffee-cup"),
    Drink(name: "茶", proportion: 0.95, color: "Color_green-tea", image:"green-tea"),
    Drink(name: "運動飲料", proportion: 0.97, color: "Color_water", image:"sport-bottle"),
    Drink(name: "可樂", proportion: 0.92, color: "Color_soda", image:"soda"),
    Drink(name: "牛奶", proportion: 0.87, color: "Color_milk", image: "milk"),
    Drink(name: "果汁", proportion: 0.85, color: "Color_juice", image:"juice"),
    Drink(name: "啤酒", proportion: 0.42, color: "Color_beer", image:"beer"),
    Drink(name: "可可", proportion: 0.5, color: "Color_coco", image:"coco"),
    Drink(name: "葡萄酒", proportion: 0.28, color: "Color_wine", image:"wine"),
]
