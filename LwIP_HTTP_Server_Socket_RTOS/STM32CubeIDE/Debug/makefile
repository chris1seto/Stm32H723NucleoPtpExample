################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middlewares/LwIP/apps/http/subdir.mk
-include Middlewares/LwIP/Netif/subdir.mk
-include Middlewares/LwIP/Core/IPv4/subdir.mk
-include Middlewares/LwIP/Core/subdir.mk
-include Middlewares/LwIP/Api/subdir.mk
-include Middlewares/FreeRTOS/portable/subdir.mk
-include Middlewares/FreeRTOS/subdir.mk
-include Drivers/STM32H7xx_HAL_Driver/subdir.mk
-include Drivers/CMSIS/subdir.mk
-include Drivers/BSP/STM32H743ZI-Nucleo/subdir.mk
-include Drivers/BSP/Components/subdir.mk
-include Application/User/ptpd/src/subdir.mk
-include Application/User/subdir.mk
-include Application/Startup/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := LwIP_HTTP_Server_Socket_RTOS
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
LwIP_HTTP_Server_Socket_RTOS.elf \

MAP_FILES += \
LwIP_HTTP_Server_Socket_RTOS.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
LwIP_HTTP_Server_Socket_RTOS.list \


# All Target
all: main-build

# Main-build Target
main-build: LwIP_HTTP_Server_Socket_RTOS.elf secondary-outputs

# Tool invocations
LwIP_HTTP_Server_Socket_RTOS.elf LwIP_HTTP_Server_Socket_RTOS.map: $(OBJS) $(USER_OBJS) C:\Users\chris\ethptp\LwIP_HTTP_Server_Socket_RTOS\STM32CubeIDE\STM32H723ZGTX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "LwIP_HTTP_Server_Socket_RTOS.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m7 -T"C:\Users\chris\ethptp\LwIP_HTTP_Server_Socket_RTOS\STM32CubeIDE\STM32H723ZGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="LwIP_HTTP_Server_Socket_RTOS.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

LwIP_HTTP_Server_Socket_RTOS.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "LwIP_HTTP_Server_Socket_RTOS.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) LwIP_HTTP_Server_Socket_RTOS.elf LwIP_HTTP_Server_Socket_RTOS.list LwIP_HTTP_Server_Socket_RTOS.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
