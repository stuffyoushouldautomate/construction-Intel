//
//  ChatViewModel.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var input: String = ""
    private let service: ChatService
    
    init(service: ChatService = ChatService()) {
        self.service = service
        self.messages = [
            ChatMessage(role: .assistant, content: "You’re chatting with Construction Intel. Ask about NJ/NY companies, projects, or insights.")
        ]
    }
    
    func send() {
        let trimmed = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        let userMsg = ChatMessage(role: .user, content: trimmed)
        messages.append(userMsg)
        input = ""
        Task { await handle(input: trimmed) }
    }
    
    private func appendStreaming(text: String) async {
        guard let lastIndex = messages.lastIndex(where: { $0.role == .assistant }) else {
            messages.append(ChatMessage(role: .assistant, content: text))
            return
        }
        var last = messages[lastIndex]
        last.content += text
        messages[lastIndex] = last
    }
    
    private func handle(input: String) async {
        messages.append(ChatMessage(role: .assistant, content: ""))
        // pseudo-stream typing
        let typing = "Let me think… "
        for char in typing {
            await appendStreaming(text: String(char))
            try? await Task.sleep(nanoseconds: 8_000_00)
        }
        if let tool = service.detectTool(for: input) {
            let toolCall = ChatToolCall(name: tool.rawValue, arguments: input)
            messages.append(ChatMessage(role: .tool, content: "Calling \(tool.rawValue)…", toolCall: toolCall))
            let result = await service.call(tool: tool, arguments: input)
            messages.append(ChatMessage(role: .tool, content: result.resultPreview, toolResult: result))
            messages.append(ChatMessage(role: .assistant, content: "Here’s what I found: \(result.resultPreview)"))
        } else {
            messages.append(ChatMessage(role: .assistant, content: "I can search the web or pull company intel. Try: ‘Search Empire Transit news’ or ‘Company intel for Metro Paving’."))
        }
    }
}

