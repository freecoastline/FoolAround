//
//  ContentView.swift
//  FoolAround
//
//  Created by ken on 2025/9/1.
//

import SwiftUI

struct ContentView: View {
    var timeLabel = DateFormat().formatDate(Date())

    var body: some View {
        VStack {
            Text(timeLabel)
                .font(.footnote)
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
