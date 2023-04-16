
# NeuraFit: AI-Powered Exercise Tracker

## Description

NeuraFit is a cutting-edge Flutter app that utilizes machine learning and PoseNet technology to help users optimize their exercise routines. The app leverages the device's camera to accurately detect the position and pose of the user during their workout sessions in real-time. By analyzing the user's posture and movements, NeuraFit provides instant feedback on their exercise performance, helping them improve their form and technique for maximum effectiveness.

With NeuraFit, users can track their exercise progress over time, view their exercise history, and set personalized fitness goals. The app also includes a backend built using TypeScript, which securely handles user data, including exercise details, and provides a seamless and smooth user experience.


## Features

- Real-time pose detection: Utilizing PoseNet machine learning model, NeuraFit accurately detects the user's pose and provides feedback on their exercise performance in real-time.
- Exercise tracking: NeuraFit keeps a record of the user's exercise history, allowing them to track their progress and monitor their improvement over time.
- Personalized fitness goals: Users can set personalized fitness goals, such as increasing the number of reps or improving form, and track their progress towards achieving them.
- Backend using TypeScript: NeuraFit's backend, built using TypeScript, ensures secure and efficient handling of user data, providing a seamless experience for the users.
- User-friendly interface: NeuraFit features an intuitive and easy-to-use interface, making it accessible for users of all fitness levels to track and improve their exercise performance.
    
  
    
    
    
## Installation

* ### To start using NeuraFit App, follow the steps below:

Step 1: Clone the Repository

```bash
git clone https://github.com/san234751/solveforindia.git
```

Step 2: Install Dependencies

Navigate to the cloned repository in your local development environment and run the following command to install the required dependencies: 

```bash
cd solveforindia/app
flutter pub get
```

This will install all the necessary packages and dependencies required for NeuraFit to run smoothly.

Step 3: Run the App
Connect your physical device or emulator to your development environment and run the following command to launch the NeuraFit app:

```bash
flutter run
```

This will build and run the app on your device or emulator, allowing you to start using NeuraFit and take advantage of its powerful AI-powered exercise tracking features.

Note: Make sure you have Flutter and Dart SDK installed on your system before running the app. If you haven't installed Flutter yet, please refer to the official Flutter documentation for instructions on how to set up Flutter on your development environment.

That's it! You have successfully installed NeuraFit on your device and are ready to use its machine learning and pose detection capabilities to optimize your exercise routine and track your progress. Enjoy your workouts with NeuraFit!

<br>

* ### The project uses RESTful APIs built using Node.js, Express and Mongoose, to get started: 

Clone the repo:

```bash
cd backend
```

Install the dependencies:

```bash
npm i
npx tsc
```

Set the environment variables:

```bash
cp .env.example .env
# open .env and modify the environment variables
```

Running in development:

```bash
npm run dev
```

Running in production:

```bash
# build
npm run build
# start
npm run prod
```

#### Environment Variables

The environment variables can be found and modified in the `.env` file.

```bash
MONGO_URL = mongodb+srv://username:XYZ@cluster0.h9jqd.mongodb.net
```

#### Project Structure

```
src\
 |--configs\        # Environment variables and configuration
 |--controllers\    # Controllers
 |--models\         # Mongoose models
 |--routers\        # Routes
 |--index.js        # App entry point
```

#### API Endpoints

List of available routes:

`GET /user/:id` - Get user\
`GET /session/:userId` -Get sessions\
`POST /user` - Create a user\
`POST /session` - Create a session\


## Conclusion

NeuraFit is a revolutionary Flutter app that combines the power of machine learning and pose detection to help users optimize their exercise routines and achieve their fitness goals. With real-time pose detection using PoseNet technology, NeuraFit provides instant feedback on users' exercise performance, allowing them to improve their form and technique for maximum effectiveness.

By tracking exercise history, setting personalized fitness goals, and securely handling user data using the backend built with TypeScript, PoseFit offers a seamless and user-friendly experience for fitness enthusiasts of all levels. Users can monitor their progress, make adjustments to their workouts, and track their improvement over time.

PoseFit empowers users to take control of their fitness journey by providing accurate and timely feedback, helping them perform exercises correctly, and minimizing the risk of injuries. With PoseFit, users can optimize their workouts, achieve their fitness goals, and make strides towards a healthier lifestyle.

Whether you are a beginner looking to improve your exercise form or an experienced fitness enthusiast striving for better performance, PoseFit is the ultimate exercise companion that harnesses the power of machine learning and pose detection to help you elevate your workout experience and achieve your fitness goals with confidence.
<hr>
