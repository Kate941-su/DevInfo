//
//  CPUService.swift
//  DeviceInfo
//
//  Created by Kaito Kitaya on 30.10.24.
//

import Foundation

class CPUService {
    
    
    
}

extension CPUService {
    
    func getCPUInfo() -> String? {
        var cpuInfo: processor_info_array_t!
        var numCPU: mach_msg_type_number_t = 0
        var numCPUsU: natural_t = 0
        let resultInfo: kern_return_t = host_processor_info(
            mach_host_self(),
            HOST_CPU_LOAD_INFO,
            &numCPUsU,
            &cpuInfo,
            &numCPU
        )
        guard resultInfo == KERN_SUCCESS else {
            return nil
        }
        
        var cpuUsageArray = [Double]()
        
        for i in 0..<numCPUsU {
            let count = Int32(i)
            let user = Double(cpuInfo[Int(CPU_STATE_MAX * count + CPU_STATE_USER)])
            let system = Double(cpuInfo[Int(CPU_STATE_MAX * count + CPU_STATE_SYSTEM)])
            let idle = Double(cpuInfo[Int(CPU_STATE_MAX * count + CPU_STATE_IDLE)])
            let nice = Double(cpuInfo[Int(CPU_STATE_MAX * count + CPU_STATE_NICE)])
            let total = user + system + idle + nice
            let usage = (user + system + nice) / total
            cpuUsageArray.append(usage * 100.0)
        }
        
        let _ = vm_deallocate(mach_task_self_, vm_address_t(cpuInfo), vm_size_t(numCPU))
        
        return cpuUsageArray
        
    }
    
}
