KEAD

KEAD (Kead Engine And Development) is a lightweight Termux development engine that provides a unified workflow for running C, C++, Python, Bash, Ncurses, and Web projects.

Installation

Install KEAD globally with:

git clone https://github.com/flostar-dekead/KEAD.git
cd KEAD
chmod +x setup.sh
./setup.sh

One-click install

""Install KEAD" (https://img.shields.io/badge/Install-KEAD-blue?style=for-the-badge)" (https://github.com/flostar-dekead/KEAD)

Usage

C/C++

kead run main.cpp

Modular C/C++

kead run -m main.cpp module1.cpp module2.cpp

Ncurses

kead nc program.cpp

Web

kead web index.html

Supports:

- HTML
- CSS
- JavaScript

Features

- Global "kead" command
- C/C++ compilation pipeline
- Modular project support
- Ncurses support
- Python and Bash execution
- Web development engine
- Runtime reporting
- KEAD UI system

Project Structure

KEAD/
├── kead
├── setup.sh
├── engines/
├── ui/
└── config/

License

Open source project by flostar-dekead.
