import qbs

Product {
    name: "CMSIS-DEVICE"

    Export {
        Depends {name: "cpp"}
        cpp.includePaths: ["Include"]
        cpp.driverFlags: ["-mthumb", "-mcpu=cortex-m3", "-mfloat-abi=softfp"]
        cpp.defines: {
            var def = ["THUMB", "ARM_MATH_CM3"];
            if (project.device.search("STM32F103.*6") != -1)
                def.push("STM32F103x6");
            return def;
        }
    }

    files: ["Include/*.h"]
}
