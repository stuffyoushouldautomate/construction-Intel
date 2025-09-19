//
//  ChatMessage.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

enum ChatRole: String, Codable {
    case user
    case assistant
    case tool
}

struct ChatToolCall: Codable, Hashable {
    let name: String
    let arguments: String
}

struct ChatToolResult: Codable, Hashable {
    let name: String
    let resultPreview: String
}

struct ChatMessage: Identifiable, Codable, Hashable {
    let id: String
    let role: ChatRole
    var content: String
    var toolCall: ChatToolCall?
    var toolResult: ChatToolResult?
    let createdAt: Date
    
    init(id: String = UUID().uuidString,
         role: ChatRole,
         content: String,
         toolCall: ChatToolCall? = nil,
         toolResult: ChatToolResult? = nil,
         createdAt: Date = Date()) {
        self.id = id
        self.role = role
        self.content = content
        self.toolCall = toolCall
        self.toolResult = toolResult
        self.createdAt = createdAt
    }
}

