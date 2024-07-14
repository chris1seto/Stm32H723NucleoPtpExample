################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/User/ptpd/src/ptpd_arith.c \
../Application/User/ptpd/src/ptpd_bmc.c \
../Application/User/ptpd/src/ptpd_main.c \
../Application/User/ptpd/src/ptpd_msg.c \
../Application/User/ptpd/src/ptpd_net.c \
../Application/User/ptpd/src/ptpd_protocol.c \
../Application/User/ptpd/src/ptpd_servo.c \
../Application/User/ptpd/src/ptpd_time.c \
../Application/User/ptpd/src/ptpd_timer.c 

OBJS += \
./Application/User/ptpd/src/ptpd_arith.o \
./Application/User/ptpd/src/ptpd_bmc.o \
./Application/User/ptpd/src/ptpd_main.o \
./Application/User/ptpd/src/ptpd_msg.o \
./Application/User/ptpd/src/ptpd_net.o \
./Application/User/ptpd/src/ptpd_protocol.o \
./Application/User/ptpd/src/ptpd_servo.o \
./Application/User/ptpd/src/ptpd_time.o \
./Application/User/ptpd/src/ptpd_timer.o 

C_DEPS += \
./Application/User/ptpd/src/ptpd_arith.d \
./Application/User/ptpd/src/ptpd_bmc.d \
./Application/User/ptpd/src/ptpd_main.d \
./Application/User/ptpd/src/ptpd_msg.d \
./Application/User/ptpd/src/ptpd_net.d \
./Application/User/ptpd/src/ptpd_protocol.d \
./Application/User/ptpd/src/ptpd_servo.d \
./Application/User/ptpd/src/ptpd_time.d \
./Application/User/ptpd/src/ptpd_timer.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/ptpd/src/%.o Application/User/ptpd/src/%.su Application/User/ptpd/src/%.cyclo: ../Application/User/ptpd/src/%.c Application/User/ptpd/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32H723xx -DDEBUG -c -I../../Inc -I../../Src -I../../Drivers/CMSIS/Include -I../../Drivers/CMSIS/Device/ST/STM32H7xx/Include -I../../Drivers/STM32H7xx_HAL_Driver/Inc -I../../Drivers/BSP/STM32H7xx_Nucleo -I../../Drivers/BSP/Components/Common -I../../Drivers/BSP/Components -I../../Middlewares/Third_Party/LwIP/src/include -I../../Middlewares/Third_Party/LwIP/system -I../../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../../Middlewares/Third_Party/FreeRTOS/Source -I../../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../../Middlewares/Third_Party/FreeRTOS/Source/include -I../../Utilities -I"C:/Users/chris/Stm32H723NucleoPtpExample/LwIP_HTTP_Server_Socket_RTOS/STM32CubeIDE/Application/User/ptpd/src" -I"C:/Users/chris/Stm32H723NucleoPtpExample/LwIP_HTTP_Server_Socket_RTOS/STM32CubeIDE/Application/User" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User-2f-ptpd-2f-src

clean-Application-2f-User-2f-ptpd-2f-src:
	-$(RM) ./Application/User/ptpd/src/ptpd_arith.cyclo ./Application/User/ptpd/src/ptpd_arith.d ./Application/User/ptpd/src/ptpd_arith.o ./Application/User/ptpd/src/ptpd_arith.su ./Application/User/ptpd/src/ptpd_bmc.cyclo ./Application/User/ptpd/src/ptpd_bmc.d ./Application/User/ptpd/src/ptpd_bmc.o ./Application/User/ptpd/src/ptpd_bmc.su ./Application/User/ptpd/src/ptpd_main.cyclo ./Application/User/ptpd/src/ptpd_main.d ./Application/User/ptpd/src/ptpd_main.o ./Application/User/ptpd/src/ptpd_main.su ./Application/User/ptpd/src/ptpd_msg.cyclo ./Application/User/ptpd/src/ptpd_msg.d ./Application/User/ptpd/src/ptpd_msg.o ./Application/User/ptpd/src/ptpd_msg.su ./Application/User/ptpd/src/ptpd_net.cyclo ./Application/User/ptpd/src/ptpd_net.d ./Application/User/ptpd/src/ptpd_net.o ./Application/User/ptpd/src/ptpd_net.su ./Application/User/ptpd/src/ptpd_protocol.cyclo ./Application/User/ptpd/src/ptpd_protocol.d ./Application/User/ptpd/src/ptpd_protocol.o ./Application/User/ptpd/src/ptpd_protocol.su ./Application/User/ptpd/src/ptpd_servo.cyclo ./Application/User/ptpd/src/ptpd_servo.d ./Application/User/ptpd/src/ptpd_servo.o ./Application/User/ptpd/src/ptpd_servo.su ./Application/User/ptpd/src/ptpd_time.cyclo ./Application/User/ptpd/src/ptpd_time.d ./Application/User/ptpd/src/ptpd_time.o ./Application/User/ptpd/src/ptpd_time.su ./Application/User/ptpd/src/ptpd_timer.cyclo ./Application/User/ptpd/src/ptpd_timer.d ./Application/User/ptpd/src/ptpd_timer.o ./Application/User/ptpd/src/ptpd_timer.su

.PHONY: clean-Application-2f-User-2f-ptpd-2f-src

