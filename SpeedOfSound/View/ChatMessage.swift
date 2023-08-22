//
//  ChatMessage.swift
//  SwiftUIFirebase
//
//  Created by 許桓菘 on 2023/8/8.
//


import Foundation
import FirebaseFirestoreSwift

struct ChatMessage: Codable, Identifiable {
    @DocumentID var id: String?
    let fromId, toId, text: String
    let profileImageUrl: String
    let timestamp: Date
}
