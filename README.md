# RISC-V Operating System Kernel

This project implements a minimal operating system kernel for the RISC-V architecture. It was developed as part of the university course **OS1 (Operating Systems 1)**.

The goal of the project is to demonstrate core operating system mechanisms such as thread management, context switching, synchronization primitives, and system call handling in a low-level environment.

---

## Project Overview

The kernel provides a basic execution environment with support for:

* Thread creation and management
* Cooperative (synchronous) context switching
* Scheduler implementation
* Semaphores for synchronization
* System call interface
* Memory management support
* RISC-V supervisor mode execution

The implementation is written in C++ with RISC-V assembly and targets an educational operating system environment.

---

## Implemented Features

* Thread Control Block (TCB)
* Cooperative context switching
* Scheduler
* Semaphores
* System call mechanism
* Basic memory management
* RISC-V trap handling

---

## Not Implemented

This project does not implement asynchronous context switching. The following features are intentionally omitted:

* Asynchronous timer interrupts and time-sharing
* Context switching on time slice expiration
* Thread sleeping and waking (`time_sleep`)
* Console output subsystem (`putc`)
* Console input subsystem (`getc`)

---

## Build and Run

The project is built using the provided Makefile.

### Build

```bash
make
```

### Run in QEMU

```bash
make qemu
```

### Run with GDB support

```bash
make qemu-gdb
```

### Clean build artifacts

```bash
make clean
```

### Requirements

* RISC-V cross toolchain (riscv64-unknown-elf or compatible)
* QEMU for RISC-V (`qemu-system-riscv64`)
* GNU Make

---

## Course Information

* Course: OS1 (Operating Systems 1)
* Architecture: RISC-V
* Language: C++ and RISC-V assembly
* Type: Educational kernel project

---

## Documentation

The full project specification is provided in the accompanying PDF (in Serbian) included in this repository.

---

## Disclaimer

This project was developed strictly for educational purposes as part of university coursework.
