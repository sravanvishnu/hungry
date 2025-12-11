# Hungry 🍽️

> **Refactoring your fridge, one byte at a time.**

🔴 **[LIVE DEMO: Click here to try Hungry](https://YOUR_USERNAME.github.io/hungry/)**

---

## 📖 The Story
Hungry is an **asynchronous culinary engine** designed to solve the entropy of a messy pantry.

We've all stared into a fridge full of random ingredients (entropy) and felt the decision paralysis (latency). Hungry solves this by interfacing with **Google's Gemini 2.5 Flash model**. It parses your unstructured input—scraps, leftovers, and staples—and leverages generative probability to procedurally construct high-fidelity, Michelin-style recipes.

Built with **Flutter Web**, it wraps complex LLM orchestration in a beautiful, distraction-free "Dark Mode" UI that feels less like a tool and more like magic.

## ⚡ Tech Stack

* **Inference Engine:** Google Gemini 2.5 Flash (via `google_generative_ai`).
* **Architecture:** Flutter Web (Dart) with reactive state management.
* **Rendering:** Custom Markdown parsing for structured recipe presentation.
* **CI/CD:** Automated build-and-inject pipeline via GitHub Actions.

## 📸 Screenshots
| Empty State | Recipe Generated |
|:---:|:---:|
| *(You can upload a screenshot here later)* | *(And another one here)* |

---

## 👨‍💻 For Developers (Running Locally)

If you want to clone this repository and run the codebase yourself:

1.  **Clone the repository**
    ```bash
    git clone [https://github.com/YOUR_USERNAME/hungry.git](https://github.com/YOUR_USERNAME/hungry.git)
    cd hungry
    ```

2.  **Install dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run with API Key Injection**
    *System requires a valid Gemini API Key injected at build time.*
    ```bash
    flutter run -d chrome --dart-define=GOOGLE_API_KEY=YOUR_KEY_HERE
    ```

---
*_Built with 🖤 by sravanvishnu_*
