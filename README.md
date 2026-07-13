# KEAD

**KEAD (Kead Engine And Development)** is a lightweight Termux development engine that provides a unified workflow for running C, C++, Python, Bash, Ncurses, and Web projects.

## Installation

Install KEAD globally:

```bash
git clone https://github.com/flostar-dekead/KEAD.git
cd KEAD
chmod +x setup.sh
./setup.sh
```

## One-click install

[![Install KEAD](https://img.shields.io/badge/Install-KEAD-blue?style=for-the-badge&logo=linux)](https://github.com/flostar-dekead/KEAD)

## Usage

### C/C++

```bash
kead run main.cpp
```

### Modular C/C++

```bash
kead run -m main.cpp module1.cpp module2.cpp
```

### Ncurses

```bash
kead nc program.cpp
```

### Web

```bash
kead web index.html
```

### Python

```bash
kead run script.py
```

### Bash

```bash
kead run script.sh
```

## Supported Web Files

- HTML
- CSS
- JavaScript

## Features

- Global `kead` command
- C/C++ compilation pipeline
- Modular C/C++ project support
- Ncurses application support
- Python execution
- Bash execution
- Web development engine
- Runtime reporting
- KEAD UI system

## Project Structure

```text
KEAD/
├── kead
├── setup.sh
├── engines/
│   ├── backend.sh
│   ├── modular.sh
│   ├── ncurses.sh
│   └── web.sh
├── ui/
│   ├── colors.sh
│   ├── finish.sh
│   ├── header.sh
│   ├── output.sh
│   ├── pipeline.sh
│   └── runtime.sh
└── config/
    └── settings.sh
```

## Roadmap

- [x] Global installation
- [x] C/C++ execution
- [x] Modular builds
- [x] Ncurses support
- [x] Web engine

## License

Open source project by **flostar-dekead**.
