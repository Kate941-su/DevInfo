//
//  RootView.swift
//  DeviceInfo
//
//  Created by Kaito Kitaya on 30.10.24.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    
    @State var debugCPUData = ""
    
    let cpuStore = Store(initialState: CPUFeature.State()){
        CPUFeature(cpuService: CPUService())
    }
    
    var body: some View {
        WithViewStore(self.cpuStore, observe: { $0 }) { viewStore in
            VStack {
                Button() {
                    cpuStore.send(.addButtonTapped(data: ""))
                }label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }
                
                Text(viewStore.dummy)
            }
            .padding()
        }
    }
}

#Preview {
    RootView()
}
