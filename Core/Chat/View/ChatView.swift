//
//  ChatView.swift
//  Construction Intel
//
//  Created by AI on 9/19/25.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var viewModel = ChatViewModel()
    @FocusState private var focused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.messages) { message in
                            ChatBubble(message: message)
                                .id(message.id)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .onChange(of: viewModel.messages.count) { _ in
                    if let lastId = viewModel.messages.last?.id {
                        withAnimation { proxy.scrollTo(lastId, anchor: .bottom) }
                    }
                }
            }
            Divider()
            HStack(spacing: 8) {
                TextField("Ask Construction Intel…", text: $viewModel.input, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .focused($focused)
                Button(action: { viewModel.send(); focused = true }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(.black)
                        .clipShape(Circle())
                }
                .disabled(viewModel.input.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .padding(.all, 12)
            .background(.ultraThinMaterial)
        }
        .navigationTitle("Chat")
    }
}

struct ChatBubble: View {
    let message: ChatMessage
    var body: some View {
        HStack(alignment: .bottom) {
            if message.role == .assistant || message.role == .tool {
                Spacer(minLength: 42)
                bubble(content: messageContent)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                bubble(content: message.content)
                    .tint(.white)
                    .background(Color.black)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    private var messageContent: String {
        if let tool = message.toolCall {
            return "🔧 Tool: \(tool.name)\nArgs: \(tool.arguments)"
        }
        if let result = message.toolResult {
            return "📄 Result: \(result.resultPreview)"
        }
        return message.content
    }
    
    private func bubble(content: String) -> some View {
        Text(content)
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    NavigationStack { ChatView() }
}

