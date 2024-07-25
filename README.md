# Consecutive Add Multiplier

This Verilog project simulates a comprehensive multiplier based on consecutive additions. The system is designed to take three inputs \(A\), \(B\), and \(C\), multiply \(A\) and \(B\) using consecutive additions, and output the minimum of \(A * B\) and \(C\).

![multiplication_image](https://atlas-content-cdn.pixelsquid.com/stock-images/multiplication-math-symbol-orange-KaZKA66-600.jpg)

## Overview

The consecutive add multiplier system efficiently performs multiplication through repetitive addition. It is designed to be resource-efficient and is suitable for FPGA implementations. This design ensures accurate results and reliable operation, making it a suitable choice for digital system projects.

## Components

### ASM Chart

The ASM Chart for the multiplier is designed to handle the multiplication of two numbers using consecutive additions and output the minimum result when compared to a third input.

### Datapath

The datapath consists of the following components:
- **3x MUX**: Used for selecting inputs based on control signals.
- **5x Registers**: Used to store intermediate and final values.
- **1x Adder**: Performs the addition operations.
- **1x Signed Comparator**: Compares signed numbers.
- **1x Unsigned Comparator (abs)**: Compares unsigned numbers.
- **1x n-bit OR**: Used for bitwise OR operations.
- **1x SR Flip-Flop**: Used for controlling the ready signal.

### Control Unit

The control unit is responsible for managing the states of the system and generating the necessary control signals. It operates in three states:
1. **Initial State (init)**
2. **Compare State (compare)**
3. **Multiply State (mul)**

### Integration of Datapath and Control Unit

The datapath and control unit are integrated to form a cohesive system where the datapath outputs serve as inputs to the control unit and vice versa. This integration ensures synchronized operations and accurate results.

## Test Bench

The test bench verifies the functionality of the multiplier by simulating various input scenarios and comparing the output with expected results. This ensures the design performs as intended under different conditions.

## Conclusion

This Verilog project demonstrates a robust and efficient approach to multiplication using consecutive additions. The design is verified through comprehensive timing analysis and test bench simulations, making it a reliable choice for FPGA implementations.

## Usage

To run the testbench, you'll need to have either ModelSim or `iverilog` installed on your computer. You can run the testbench with `iverilog` on macOS using the following command:
```
cd code
iverilog -o test circuit_TB.v circuit.v
vvp test
```

## Authors
- [Rozhin Taghizadegan](https://github.com/RozhTagh)
