# Hungry 🍽️

**Turn your leftovers into gourmet meals.**

Hungry is a minimalist, AI-powered kitchen assistant that solves the "what's for dinner?" problem. It uses Google's Gemini 2.5 Flash model to instantly generate creative, Michelin-style recipes based on whatever ingredients you have in your pantry.

## ✨ Features

- **🧠 AI Chef:** Powered by Google's latest `gemini-2.5-flash` model for high-quality culinary creativity.
- **🌑 Classy UI:** A modern, distraction-free dark mode interface with smooth animations.
- **⚡ Instant Results:** Typeset, easy-to-read recipes formatted in Markdown.
- **🌍 Web Native:** Built with Flutter Web for a seamless browser experience.

## 🛠️ Tech Stack

- **Framework:** [Flutter](https://flutter.dev) (Dart)
- **AI Engine:** [Google Gemini API](https://ai.google.dev/)
- **Deployment:** GitHub Pages (via GitHub Actions)

## 🚀 Getting Started

Follow these steps to run Hungry on your local machine.

### Prerequisites

- Flutter SDK installed.
- A free [Google Gemini API Key](https://aistudio.google.com/).

### Installation

1.  **Clone the repository**

    ```bash
    git clone [https://github.com/YOUR_USERNAME/hungry.git](https://github.com/YOUR_USERNAME/hungry.git)
    cd hungry
    ```

2.  **Install dependencies**

    ```bash
    flutter pub get
    ```

3.  **Run the app**
    _Note: You must pass your API key at runtime for security._
    ```bash
    flutter run -d chrome --dart-define=GOOGLE_API_KEY=YOUR_AI_KEY_HERE
    ```

## 🌐 Deployment

This project includes a CI/CD workflow to automatically deploy to **GitHub Pages**.

1.  Push this code to a GitHub repository.
2.  Go to **Settings > Secrets and variables > Actions**.
3.  Add a new repository secret named `GOOGLE_API_KEY` with your API key.
4.  The action will automatically build and publish your site!

---

_Built with 🖤 by sravanvishnu_
