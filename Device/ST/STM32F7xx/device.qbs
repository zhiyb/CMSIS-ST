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

    Group {
        name: "STM32F745xx"
        condition: project.device.search("STM32F745") != -1
        files: ["Include/stm32f745xx.h"]
    }
    Group {
        name: "STM32F746xx"
        condition: project.device.search("STM32F746") != -1
        files: ["Include/stm32f746xx.h"]
    }
    Group {
        name: "STM32F756xx"
        condition: project.device.search("STM32F756") != -1
        files: ["Include/stm32f756xx.h"]
    }
    Group {
        name: "STM32F722xx"
        condition: project.device.search("STM32F722") != -1
        files: ["Include/stm32f722xx.h"]
    }

    files: [
        "Include/stm32f7xx.h",
        "Include/system_stm32f7xx.h",
    ]
}
