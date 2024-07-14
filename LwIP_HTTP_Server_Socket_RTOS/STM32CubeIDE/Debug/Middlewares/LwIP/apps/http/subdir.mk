################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/chris/ethptp/LwIP_HTTP_Server_Socket_RTOS/Middlewares/Third_Party/LwIP/src/apps/http/fs.c 

OBJS += \
./Middlewares/LwIP/apps/http/fs.o 

C_DEPS += \
./Middlewares/LwIP/apps/http/fs.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/LwIP/apps/http/fs.o: C:/Users/chris/ethptp/LwIP_HTTP_Server_Socket_RTOS/Middlewares/Third_Party/LwIP/src/apps/http/fs.c Middlewares/LwIP/apps/http/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32H723xx -DDEBUG -c -I../../Inc -I../../Src -I../../Drivers/CMSIS/Include -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/BSP/STM32H7xx_Nucleo -I../../Drivers/BSP/Components/Common -I../../Drivers/BSP/Components -I../../Middlewares/Third_Party/LwIP/src/include -I../../Middlewares/Third_Party/LwIP/system -I../../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../../Middlewares/Third_Party/FreeRTOS/Source -I../../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../../Middlewares/Third_Party/FreeRTOS/Source/include -I../../Utilities -I"C:/Users/chris/ethptp/LwIP_HTTP_Server_Socket_RTOS/STM32CubeIDE/Application/User/ptpd/src" -I"C:/Users/chris/ethptp/LwIP_HTTP_Server_Socket_RTOS/STM32CubeIDE/Application/User" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-LwIP-2f-apps-2f-http

clean-Middlewares-2f-LwIP-2f-apps-2f-http:
	-$(RM) ./Middlewares/LwIP/apps/http/fs.cyclo ./Middlewares/LwIP/apps/http/fs.d ./Middlewares/LwIP/apps/http/fs.o ./Middlewares/LwIP/apps/http/fs.su

.PHONY: clean-Middlewares-2f-LwIP-2f-apps-2f-http

