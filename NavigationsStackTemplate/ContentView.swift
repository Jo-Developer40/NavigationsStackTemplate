//
// NavigationsStackTemplate
// ContentView.swift
//
// Created by Juergen Schulz 24.10.2025
//
// This file defines the main navigation structure of the app using SwiftUI's NavigationStack.
// It includes a dynamic navigation path and multiple destination views.
//

import SwiftUI


// Enum representing the different views in the app.
// Each case corresponds to a specific destination in the navigation stack.
enum AppView: Hashable {
    case page1View
    case page2View
    case page3View
    case settings
}

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme // Environment variable to detect the current color scheme (light/dark mode).
    @State private var path: [AppView] = [] // State variable to manage the navigation path.
    
    var body: some View {
        // NavigationStack manages the navigation hierarchy.
        NavigationStack(path: $path) {
            ZStack {
                VStack(spacing: 45) {
                    Text("Your code for this page")  // Placeholder
                        .font(.largeTitle.bold())
                        .foregroundStyle(.blue)
                }
                .padding()
            }
            .navigationTitle("ContentView") // Title for the main view.
            .navigationBarTitleDisplayMode(.inline) // Display the title inline.
            .toolbar { // Toolbar with navigation buttons.
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationButton(path: $path, title: "Page 1", icon: "chevron.right", destination: .page1View)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationButton(path: $path, icon: "gearshape", destination: .settings)
                }
            }
            .navigationDestination(for: AppView.self) { view in // Define destinations for the navigation stack.
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

/// A reusable button component for navigation.
/// It appends the specified destination to the navigation path when tapped.
struct NavigationButton: View {
    @Binding var path: [AppView] // Binding to the navigation path.
    
    var title: String? = nil // Optional title for the button.
    var icon: String // Icon name for the button.
    var destination: AppView // Destination to navigate to.

    var body: some View {
        Button {
            path.append(destination) // Append the destination to the path.
        } label: {
            HStack {
                if let title = title { Text(title) } // Display the title if provided.
                Image(systemName: icon) // Display the icon.
            }
        }
    }
}

// View representing the first page in the navigation stack.
struct Page1View_: View {
    @Binding var path: [AppView] // Binding to the navigation path.
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Your code for this page")  // Placeholder
                .font(.largeTitle.bold())
                .foregroundStyle(.gray)
        }
        .padding()
        .navigationTitle("Page 1") // Title for Page 1.
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationButton(path: $path, title: "Page 2", icon: "chevron.right", destination: .page2View)
            }
        }
    }
}

// View representing the second page in the navigation stack.
struct Page2View_: View {
    @Binding var path: [AppView] // Binding to the navigation path.
    
    var body: some View {
        VStack {
            Text("Your code for this page")  // Placeholder
                .font(.largeTitle.bold())
                .foregroundStyle(.red)
        }
        .navigationTitle("Page 2") // Title for Page 2.
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationButton(path: $path, title: "Page 3", icon: "chevron.right", destination: .page3View)
            }
        }
    }
}

// View representing the third page in the navigation stack.
struct Page3View_: View {
    @Binding var path: [AppView] // Binding to the navigation path.
    
    var body: some View {
        VStack {
            Text("Your code for this page") // Placeholder
                .font(.largeTitle.bold())
                .foregroundStyle(.green)
        }
        .navigationTitle("Page 3") // Title for Page 3.
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    path.removeAll() // Clear the navigation path to return to the root.
                } label: {
                    HStack {
                        Text("ContentView")
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
    }
}

// View representing the settings page in the navigation stack.
struct SettingsView_: View {
    @Binding var path: [AppView] // Binding to the navigation path.
    
    var body: some View {
        VStack {
            Text("Your code for Settings") // Placeholder text for the Settings page.
                .font(.largeTitle.bold())
                .foregroundStyle(.orange)
        }
        .navigationTitle("Settings") // Title for the Settings page.
        .toolbar {
            // Optional: Add toolbar items for the Settings page.
        }
    }
}

// Preview provider for ContentView.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
