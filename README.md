🐻 Animated Login with Rive & Flutter
An interactive login screen built using Flutter and Rive, where an animated bear reacts in real time based on user interaction.

✨ Features
•	Interactive animation controlled by a State Machine
•	Bear follows the cursor while typing the email
•	Bear covers its eyes while typing the password
•	Password visibility toggle button
•	Focus-based animation triggers
•	Responsive design
•	Hot Reload for fast development
•	Full Git & GitHub integration
🎨 What is Rive?
Rive is a real-time interactive vector animation tool. Unlike traditional GIFs or videos, Rive animations can be controlled programmatically and respond dynamically to user input across mobile, web, and desktop applications.
🔁 What is a State Machine?
A State Machine is the logical system that controls how animations transition between states. It works using boolean inputs (SMIBool), triggers (SMITrigger), and automatic transitions. In this project:
- isChecking → The bear looks at the email input
- isHandsUp → The bear covers its eyes
- trigSuccess → Successful login
- trigFail → Failed login

Rive provides the design. The State Machine provides the logic. Flutter connects everything together.
🛠 Technologies Used
•	Flutter
•	Dart
•	Rive
•	Rive State Machine
•	Git
•	GitHub
•	Visual Studio Code
📁 Basic Project Structure (lib folder)
lib/
│
├── main.dart
├── screens/
│   └── login_screen.dart
└── assets/
    └── animated_login_bear.riv

🎬 Demo
Insert your demo GIF in your GitHub repository and use the following markdown:

![App Demo](demo.gif)
📚 Course
Graficación (Computer Graphics)
👨‍🏫 Professor
Rodrigo Fidel Gaxiola Sosa
🎨 Animation Credits
Animation obtained from Rive Marketplace.
Created by: dexterc
Marketplace link:
https://rive.app/marketplace/3645-7621-remix-of-login-machine/

Author profile:
https://rive.app/@dexterc/

Design reference from Dribbble:
https://dribbble.com/shots/22810177-RiveBear-Login-Animated-Polar-Bear-Flutter-Rive-Widget
