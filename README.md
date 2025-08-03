# UART Transmitter & Receiver – Verilog RTL Project

This project implements a **UART (Universal Asynchronous Receiver Transmitter)** system using Verilog HDL. It includes both the transmitter and receiver modules with testbench and simulation.

---

## 🔧 Features

- 8-bit data transmission
- Start & Stop bits
- FSM-based logic for TX & RX
- Loopback test (TX connected to RX)
- Works with ModelSim/Vivado

---

## 📁 Project Structure

```
UART-Project/
│
├── rtl/
│   ├── uart_tx.v
│   └── uart_rx.v
│
├── tb/
│   └── uart_tb.v
│
├── waveform/
│   └── waveform.png  # (optional)
│
└── README.md
```

---

## ▶️ How to Run Simulation

### ModelSim:

1. Create a new project
2. Add `uart_tx.v`, `uart_rx.v`, and `uart_tb.v`
3. Set `uart_tb` as top module
4. Run simulation and analyze waveform

### Vivado:

1. Create a new RTL project
2. Add RTL and testbench files
3. Set simulation top as `uart_tb`
4. Run behavioral simulation

---

## 📌 Skills Demonstrated

- Verilog RTL Design
- Serial Communication Protocols
- FSM Design
- Testbench Creation & Simulation

---

## 📜 License

Educational use only.
