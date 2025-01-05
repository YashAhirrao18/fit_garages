
# **FitGarages**

FitGarages is a **Flutter mobile application** designed to offer users a seamless and intuitive experience with a focus on platform-specific navigation, dynamic widget creation, and Razorpay payment integration. The app also fetches and displays **location** and **device information** while providing a modern, visually appealing UI.

<img src="https://github.com/user-attachments/assets/1386b4b8-7c73-4c30-a83d-d8285fc50bff" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/e61e35a7-78e7-4f43-b38a-948ed66a2207" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/52779b63-ca6f-497d-81c0-b11129e9348d" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/01f65b09-2a66-4580-ac6b-34f8c6962a09" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/2aa884bd-dd2c-46cf-b224-778202f507fe" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/ded4f781-4553-49e6-8460-9ce06efa7e07" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/25ce39a1-dcc0-4794-a4ed-b790932e756c" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/1b592948-a77c-4d54-8e97-4e2cadbbac68" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/b297f7ca-559e-4d76-8f00-395eb0f5ec09" width="300" height="600" />

## **Problem Statement**

The need for a simple, yet feature-rich mobile application that allows users to:
- Easily navigate using platform-native patterns (iOS and Android).
- Create, modify, and manage dynamic widgets.
- Integrate payment gateways like **Razorpay** to process transactions.
- Fetch device and location information for a personalized experience.

## **Solution**

FitGarages is built using **Flutter**, ensuring a native-like experience on both iOS and Android devices. The app implements:
- A **platform-specific navigation bar** for iOS and Android.
- **Floating Action Button** to facilitate profile creation.
- **Dynamic widgets** to allow users to add and delete personal details.
- **Horizontal scrolling banner** with a "Book Now" button leading to Razorpay payment integration.
- **Razorpay payment flow** to simulate real-world payment processing.

## **Features**

### 1. **Platform-Specific Navigation Bar**
- **iOS:** A **curved navigation bar** placed at the bottom of the screen, providing easy access to the main sections.
- **Android:** A **drawer navigation** replicating Android's native look, housing the same set of tabs.

---

### 2. **Floating Action Button**
- Clicking the **floating action button** triggers a dialog asking if the user would like to add a profile. Upon confirmation, the user is redirected to a screen to create **dynamic widgets** (with text fields and dropdown menus) to input personal details.

---

### 3. **Dynamic Widget Creation and Deletion**
- Users can **add** or **delete dynamic widgets** (cards with user input).
- Clicking a widget triggers fetching the **device's information** (via `device_info_plus` package) and **current location** (via `geolocator` package).
- The **Detail Screen** displays all user data and device info for review.

---

### 4. **Horizontal Scrolling Banner**
- A **horizontal scrolling banner** occupying the top 20% of the screen features:
  - An **image** or **icon**.
  - A **heading** and **subheading**.
  - A **"Book Now"** button that navigates to the Razorpay payment integration page.

---

### 5. **Razorpay Payment Integration**
- Clicking **"Book Now"** takes the user to:
  1. **Order Creation Screen** to enter payment details.
  2. **Payment Info Screen** to select the payment method.
  3. **Result Screen** showing payment success or failure.
  
**Note:** This feature is simulated with pseudo-code, and Razorpay API requests are commented out for future integration.

---

### 6. **Splash Screen and UI Enhancements**
- The app starts with an engaging **Splash Screen**, featuring an animated **bike icon** and branding.
- The **UI** is designed with **modern enhancements** for a clean, intuitive experience.

---

## **Installation and Setup**

### **Prerequisites**

To run this project on your local machine, you'll need:
- **Flutter SDK** ([Installation guide](https://flutter.dev/docs/get-started/install))
- **Android Studio** or **Visual Studio Code** with Flutter and Dart plugins installed.
- **Xcode** (for iOS development) or **Android Emulator** for testing.

---

### **Steps to Run the Project**

1. **Clone the repository:**

   ```bash
   git clone https://github.com/YashAhirrao18/fit_garages.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd fit_garages
   ```

3. **Install dependencies:**

   Run the following command to install all necessary packages:

   ```bash
   flutter pub get
   ```

4. **Run the application:**

   To run the app on an Android or iOS emulator, use:

   ```bash
   flutter run
   ```

---

## **Packages Used**

- **geolocator**: To fetch the user's current location.
- **device_info_plus**: To retrieve the device's information (model, make, screen size, etc.).
- **flutter_curve_navigation_bar**: For the curved navigation bar on iOS.
- **razorpay_flutter**: (Pseudo code integration) For Razorpay payment gateway integration.

---


## How It Works

### 1. Navigation Bar:
- **iOS**: The bottom **curved navigation bar** provides smooth navigation between sections.
- **Android**: The **drawer** allows the same navigation but in line with Android's design philosophy.
<!-- Adjust the size of images -->
<img src="https://github.com/user-attachments/assets/e61e35a7-78e7-4f43-b38a-948ed66a2207" width="300" height="600" />

### 2. Floating Action Button and Dialog:
- When clicked, the **floating action button** opens a dialog asking the user to proceed with adding a profile. Upon confirmation, the app navigates to the screen for **dynamic widget creation**.
<img src="https://github.com/user-attachments/assets/52779b63-ca6f-497d-81c0-b11129e9348d" width="300" height="600" />

### 3. Dynamic Widget:
- Users input personal details, and the app fetches **device information** and **location data**. All details are shown on the **Detail Screen** for review.
<img src="https://github.com/user-attachments/assets/01f65b09-2a66-4580-ac6b-34f8c6962a09" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/2aa884bd-dd2c-46cf-b224-778202f507fe" width="300" height="600" />

### 4. Horizontal Scrolling Banner:
- This component is designed to display offers or promotions, and the **"Book Now"** button triggers the Razorpay payment integration.
<img src="https://github.com/user-attachments/assets/ded4f781-4553-49e6-8460-9ce06efa7e07" width="300" height="600" />

### 5. Razorpay Payment:
- The **Razorpay payment flow** includes:
  1. **Order creation screen**.
  2. **Payment method selection** (Google Pay, PhonePe, etc.).
  3. **Result screen** showing whether the payment was successful.
<img src="https://github.com/user-attachments/assets/25ce39a1-dcc0-4794-a4ed-b790932e756c" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/1b592948-a77c-4d54-8e97-4e2cadbbac68" width="300" height="600" />
<img src="https://github.com/user-attachments/assets/b297f7ca-559e-4d76-8f00-395eb0f5ec09" width="300" height="600" />

---

## **Contributing**

We welcome contributions! If you find any bugs or want to improve this app, feel free to fork the repository and submit a pull request. Make sure to follow best practices and maintain consistent coding style.

---

## **License**

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## **Contact**

If you have any questions, feel free to reach out:

- **Email**: yashsharadahirrao18@gmail.com
- **GitHub**: [YashAhirrao18](https://github.com/YashAhirrao18)

---
