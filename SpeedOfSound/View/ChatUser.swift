//
//  ChatUser.swift
//  SwiftUIFirebase
//
//  Created by 許桓菘 on 2023/8/5.
//

import FirebaseFirestoreSwift

struct ChatUser: Codable, Identifiable {
    @DocumentID var id: String?
    let uid, email, profileImageUrl: String
}

