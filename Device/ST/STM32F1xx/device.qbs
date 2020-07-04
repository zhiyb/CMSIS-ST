import qbs

Product {
    name: "CMSIS-DEVICE"

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["Include"]
        cpp.driverFlags: ["-mthumb", "-mcpu=cortex-m3", "-mfloat-abi=softfp"]
        cpp.defines: {
            var def = ["THUMB", "ARM_MATH_CM3"];
            if (project.device.search("STM32F103C8") != -1)
                def.push("STM32F103xB");
            else if (project.device.search("STM32F103R8") != -1)
                def.push("STM32F103xB");
            else if (project.device.search("STM32F103T8") != -1)
                def.push("STM32F103xB");
            else if (project.device.search("STM32F103V8") != -1)
                def.push("STM32F103xB");
            else if (project.device.search("STM32F103CB") != -1)
                def.push("STM32F103xB");
            else if (project.device.search("STM32F103RB") != -1)
                def.push("STM32F103xB");
            else if (project.device.search("STM32F103TB") != -1)
                def.push("STM32F103xB");
            else if (project.device.search("STM32F103VB") != -1)
                def.push("STM32F103xB");
            return def;
        }
    }

    files: ["Include/*.h"]
}
