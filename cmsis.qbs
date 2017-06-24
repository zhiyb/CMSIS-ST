import qbs

Project {
    name: "CMSIS"

    references: {
        var ref = [];
        if (project.cmsis_dsp)
            ref.push("DSP_Lib");
        if (project.device.search("STM32F1") != -1)
            ref.push("Device/ST/STM32F1xx");
        else if (project.device.search("STM32F4") != -1)
            ref.push("Device/ST/STM32F4xx");
        else if (project.device.search("STM32F7") != -1)
            ref.push("Device/ST/STM32F7xx");
        return ref;
    }

    Product {
        name: "CMSIS"
        files: ["Include/*.h"]
        Export {
            Depends {name: "CMSIS-DEVICE"}
            Depends {name: "cpp"}
            cpp.positionIndependentCode: false
            cpp.commonCompilerFlags: [
                "-ffunction-sections", "-fdata-sections",
                "-fno-common", "-fno-strict-aliasing",
            ]
            cpp.driverFlags: ["--specs=nano.specs"]
            cpp.linkerFlags: ["-nostartfiles", "--gc-sections"];
            cpp.includePaths: ["Include"]
        }
    }
}
