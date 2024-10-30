//
//  CPUFeatures.swift
//  DeviceInfo
//
//  Created by Kaito Kitaya on 30.10.24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CPUFeature {
    let cpuService: CPUService
    @ObservableState
    struct State: Equatable {
        var dummy: String = ""
    }
    
    init(cpuService: CPUService) {
        self.cpuService = cpuService
    }
    
    enum Action {
        case addButtonTapped(data: String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case let .addButtonTapped(data):
                state.dummy = cpuService.getCPUName()
                return .none
            }
        }
    }
}
