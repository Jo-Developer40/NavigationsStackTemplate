// Swift
//
// NavigationsStackTemplate
// ContentView.swift
//
// Created by Juergen Schulz 24.10.2025
//

import SwiftUI

enum AppView: Hashable {
    case page1View
    case page2View
    case page3View
    case settings
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var path: [AppView] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack(spacing: 45) {
                    Text("Your code for this page")
                        .font(.largeTitle.bold())
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .navigationTitle("ContentView")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavButton(path: $path, title: "Page 1", icon: "chevron.right", destination: .page1View)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavButton(path: $path, icon: "gearshape", destination: .settings)
                }
            }
            .navigationDestination(for: AppView.self) { view in
                switch view {
                case .page1View:
                    Page1View_(path: $path)
                case .page2View:
                    Page2View_(path: $path)
                case .page3View:
                    Page3View_(path: $path)
                case .settings:
                    SettingsView_(path: $path)
                }
            }
        }
    }
}

struct NavButton: View {
    @Binding var path: [AppView]
    var title: String? = nil
    var icon: String
    var destination: AppView

    var body: some View {
        Button {
            path.append(destination)
        } label: {
            HStack {
                if let title = title { Text(title) }
                Image(systemName: icon)
            }
        }
    }
}

struct Page1View_: View {
    @Binding var path: [AppView]
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Your code for this page")
                .font(.largeTitle.bold())
                .foregroundColor(.gray)
        }
        .padding()
        .navigationTitle("Page 1")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavButton(path: $path, title: "Page 2", icon: "chevron.right", destination: .page2View)
            }
        }
    }
}

struct Page2View_: View {
    @Binding var path: [AppView]
    
    var body: some View {
        VStack {
            Text("Your code for this page")
                .font(.largeTitle.bold())
                .foregroundColor(.red)
        }
        .padding()
        .navigationTitle("Page 2")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavButton(path: $path, title: "Page 3", icon: "chevron.right", destination: .page3View)
            }
        }
    }
}

struct Page3View_: View {
    @Binding var path: [AppView]
    
    var body: some View {
        VStack {
            Text("Your code for this page")
                .font(.largeTitle.bold())
                .foregroundColor(.green)
        }
        .padding()
        .navigationTitle("Page 3")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    path.removeAll()
                } label: {
                    HStack {
                        Text("Home")
                        Image(systemName: "chevron.left")
                    }
                }
            }
        }
    }
}

struct SettingsView_: View {
    @Binding var path: [AppView]
    
    var body: some View {
        VStack {
            Text("Your code for Settings")
                .font(.largeTitle.bold())
                .foregroundColor(.orange)
        }
        .padding()
        .navigationTitle("Settings")
        .toolbar {
            // optional toolbar items
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
