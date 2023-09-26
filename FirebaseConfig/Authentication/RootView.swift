//
//  RootView.swift
//  FirebaseConfig
//
//  Created by Salih on 26.09.2023.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            AuthenticationView()
        }
    }
}

#Preview {
    RootView()
}
