//
//  Drink.swift
//  Water
//
//  Created by 許桓菘 on 2023/4/18.
//

struct Drink: Identifiable {
    var id: Int
    var name: String
    var proportion: Float
    var color: String
    var image: String
}

let drinks = [
    Drink(id: 0, name: "水", proportion: 1, color: "Color.blue", image: "glass-of-water"),
    Drink(id: 1, name: "咖啡", proportion: 0.9, color: "color.blue", image:"coffee-cup"),
    Drink(id: 2, name: "茶", proportion: 0.95, color: "Color.green", image:"green-tea"),
    Drink(id: 3, name: "運動飲料", proportion: 0.97, color: "color.blue", image:"energy-drink"),
    Drink(id: 4, name: "可樂", proportion: 0.92, color: "Color.blue", image:"soda-bottle"),
]
