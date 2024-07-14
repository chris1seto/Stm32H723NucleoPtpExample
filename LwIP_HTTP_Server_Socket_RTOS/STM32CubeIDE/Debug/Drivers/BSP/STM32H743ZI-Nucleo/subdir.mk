################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/chris/ethptp/LwIP_HTTP_Server_Socket_RTOS/Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.c 

OBJS += \
./Drivers/BSP/STM32H743ZI-Nucleo/stm32h7xx_nucleo.o 

C_DEPS += \
./Drivers/BSP/STM32H743ZI-Nucleo/stm32h7xx_nucleo.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32H743ZI-Nucleo/stm32h7xx_nucleo.o: C:/Users/chris/ethptp/LwIP_HTTP_Server_Socket_RTOS/Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.c Drivers/BSP/STM32H743ZI-Nucleo/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32H723xx -DDEBUG -c -I../../Inc -I../../Src -I../../Drivers/CMSIS/Include -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/BSP/STM32H7xx_Nucleo -I../../Drivers/BSP/Components/Common -I../../Drivers/BSP/Components -I../../Middlewares/Third_Party/LwIP/src/include -I../../Middlewares/Third_Party/LwIP/system -I../../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../../Middlewares/Third_Party/FreeRTOS/Source -I../../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../../Middlewares/Third_Party/FreeRTOS/Source/include -I../../Utilities -I"C:/Users/chris/ethptp/LwIP_HTTP_Server_Socket_RTOS/STM32CubeIDE/Application/User/ptpd/src" -I"C:/Users/chris/ethptp/LwIP_HTTP_Server_Socket_RTOS/STM32CubeIDE/Application/User" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32H743ZI-2d-Nucleo

clean-Drivers-2f-BSP-2f-STM32H743ZI-2d-Nucleo:
	-$(RM) ./Drivers/BSP/STM32H743ZI-Nucleo/stm32h7xx_nucleo.cyclo ./Drivers/BSP/STM32H743ZI-Nucleo/stm32h7xx_nucleo.d ./Drivers/BSP/STM32H743ZI-Nucleo/stm32h7xx_nucleo.o ./Drivers/BSP/STM32H743ZI-Nucleo/stm32h7xx_nucleo.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32H743ZI-2d-Nucleo

