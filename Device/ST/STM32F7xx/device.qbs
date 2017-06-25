import qbs

Product {
    name: "CMSIS-DEVICE"

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["Include"]
        cpp.driverFlags: ["-mthumb", "-mcpu=cortex-m7", "-mfloat-abi=hard", "-mfpu=fpv5-sp-d16"]
        cpp.defines: {
            var def = ["ARM_MATH_CM7", "__FPU_PRESENT=1"];
            if (project.device.search("STM32F745") != -1)
                def.push("STM32F745xx");
            else if (project.device.search("STM32F746") != -1)
                def.push("STM32F746xx");
            else if (project.device.search("STM32F756") != -1)
                def.push("STM32F756xx");
            else if (project.device.search("STM32F722") != -1)
                def.push("STM32F722xx");
            return def;
        }
    }

    files: ["Include/*.h"]
}
