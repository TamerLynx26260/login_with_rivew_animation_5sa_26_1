🐻 Animated Login with Rive & Flutter

An interactive login screen built using Flutter and Rive, where an animated bear reacts in real time based on user interaction.

This project was developed for the Computer Graphics course.

✨ Features

🧠 Interactive animation controlled by a State Machine

👀 Bear follows the cursor while typing the email

🙈 Bear covers its eyes while typing the password

🔐 Password visibility toggle button

🎯 Focus-based animation triggers

📱 Responsive design

⚡ Hot Reload for fast development

🔄 Full Git & GitHub integration

🎨 What is Rive?

Rive
 is a real-time interactive vector animation tool.

Unlike traditional GIFs or videos:

It allows dynamic interaction

It can be controlled programmatically

It is lightweight and optimized

Works across mobile, web, and desktop

In this project, Rive acts as the visual core of the interface.

🔁 What is a State Machine?

A State Machine is the logical system that controls how animations transition between states.

It works using:

Boolean inputs (SMIBool)

Triggers (SMITrigger)

Automatic transitions between animation states

In this project:

isChecking → The bear looks at the email input

isHandsUp → The bear covers its eyes

trigSuccess → Successful login

trigFail → Failed login

Rive provides the design.
The State Machine provides the logic.
Flutter connects everything together.

🛠 Technologies Used

💙 Flutter

🎯 Dart

🎨 Rive

🔁 Rive State Machine

🗂 Git

☁ GitHub

🧩 Visual Studio Code

📁 Basic Project Structure (lib folder)
lib/
│
├── main.dart
│
├── screens/
│   └── login_screen.dart
│
└── assets/
    └── animated_login_bear.riv
🎬 Demo

Place your GIF file in the root of your repository and use:

![App Demo](demo.gif)

Example:

📚 Course

Computer Graphics (Graficación)

👨‍🏫 Professor

Rodrigo Fidel Gaxiola Sosa

🎨 Animation Credits

Animation obtained from the Rive Marketplace:

https://rive.app/marketplace/3645-7621-remix-of-login-machine/

Created by: dexterc

Author profile:
https://rive.app/@dexterc/

Design reference:
https://dribbble.com/shots/22810177-RiveBear-Login-Animated-Polar-Bear-Flutter-Rive-Widget
