# 🚀 FindMyFaculty — How to Share with Friends & Deploy to Cloud

This complete guide explains how to:
1. **Share the app with friends right now** to gather real student feedback.
2. **Review your friends' feedback** directly inside the Admin Analytics Dashboard.
3. **Deploy the app 24/7 to free cloud hosting** (Render, Vercel, GitHub Pages, or Railway).

---

## 📲 Part 1: How to Share with Friends RIGHT NOW (3 Easy Ways)

### 🌟 Way 1: Instant Single-File Share (Fastest — No Hosting Needed!)
You can share the complete, working app as a single file over WhatsApp, Telegram, Google Drive, or Email:
1. From your workspace or ZIP, grab **`standalone.html`** (or rename it to `FindMyFaculty.html`).
2. Send this file to your friends on WhatsApp or upload it to Google Drive.
3. **How your friends open it:**
   - On Laptop: Double-click `FindMyFaculty.html` (opens instantly in Chrome, Edge, or Safari).
   - On Android/iPhone: Open the file directly in Chrome or Safari.
4. **Everything works immediately:** Search faculty, check Dr. R. Prema / Dr. Sivaramakrishnan, view timetables, and submit feedback!

---

### 🌐 Way 2: Free Cloud Deployment (Get a Live `https://...` URL in 3 Minutes)
If you want a real website link (e.g. `https://findmyfaculty-scsvmv.onrender.com`) that anyone can open in their browser:

#### 🟢 Option A: Deploy on Render (Recommended — Full Python Backend & Database)
1. Push your `findmyfaculty-site` folder to a new **GitHub repository** (or zip upload).
2. Go to **[https://render.com](https://render.com)** and sign up for a free account.
3. Click **"New +"** → Select **"Web Service"**.
4. Connect your GitHub repository.
5. Fill in these settings:
   - **Name:** `findmyfaculty-scsvmv` (or any name you like)
   - **Environment:** `Python 3`
   - **Build Command:** `pip install -r requirements.txt` (or leave empty)
   - **Start Command:** `python3 server.py`
   - **Instance Type:** `Free`
6. Click **"Create Web Service"**.
7. In ~60 seconds, Render will give you a live URL like:  
   👉 **`https://findmyfaculty-scsvmv.onrender.com`**  
   Send this link to all your friends and classmates!

---

#### ⚡ Option B: Deploy on Vercel or GitHub Pages (Instant Frontend Link)
If you want an instant frontend link without touching any backend settings:
1. **GitHub Pages:**
   - Create a GitHub repository named `findmyfaculty`.
   - Upload `index.html` and `app.js`.
   - Go to **Settings** → **Pages** → Source: **Deploy from branch (main)** → Save.
   - Your link is live at: `https://<your-github-username>.github.io/findmyfaculty`
2. **Vercel:**
   - Go to **[https://vercel.com](https://vercel.com)**.
   - Drag and drop your folder or import the GitHub repo.
   - Click **Deploy** → Live in 15 seconds!

---

## 💬 Part 2: How to Collect & View Your Friends' Feedback

### Step 1: Tell your friends how to submit feedback
1. Open the app as a Student (e.g., Click **Student Portal**).
2. Click the **"💬 Give Feedback"** tab in the top navigation bar.
3. Answer the 6 quick questions:
   - *How often do you find difficulty finding faculty?* (Frequently / Sometimes / Rarely)
   - *Current method to find faculty?* (Visiting cabins, WhatsApp groups, etc.)
   - *Which feature is most useful?* (Real-time Live Status, Cabin Directions, Timetables)
   - *Overall Rating:* ⭐⭐⭐⭐⭐ (1 to 5 Stars)
   - *Would you use this daily?* (Yes, definitely / Likely / No)
   - *Suggestions for improvement:* (Free text comments)
4. Click **"🚀 Submit Academic Feedback"**.

---

### Step 2: How you review all collected feedback in the Admin Dashboard
1. Log in to the **Admin Portal** using:
   - **Username:** `admin`
   - **Password:** `admin123`
2. Click the **"📊 Feedback"** tab in the top navigation bar.
3. You will see:
   - **Average Overall Star Rating** (e.g., 4.8 / 5.0 ⭐).
   - **Total Responses Count**.
   - **Most Requested Features breakdown**.
   - **Complete list of individual student reviews and suggestions**!
4. You can take screenshots of this real feedback to show your project panel during the Project Expo!

---

## 🛠️ Part 3: Deploying from your Local Laptop (Zero Internet / Offline Demo)

If the evaluation panel asks you to run it locally on the college podium laptop:
- **Windows:** Double-click **`run_windows.bat`** → Opens `http://localhost:8123` automatically.
- **Mac / Linux:** Open terminal in the folder and run `bash run_mac_linux.sh` or `python3 server.py`.

---

## 📋 Summary Checklist for the Team

| Step | Action | Status |
| :---: | :--- | :---: |
| 1 | Send `standalone.html` or Render URL to 10–20 classmates | 📤 Ready |
| 2 | Ask them to try searching for **Dr. R. Prema** & booking a slot | 👩‍🏫 Ready |
| 3 | Ask them to submit the **6-question feedback form** | 💬 Ready |
| 4 | Open Admin Portal (`admin / admin123`) → Take screenshot of feedback metrics | 📊 Ready |
| 5 | Insert live feedback numbers into your **Slide 9 (Survey Validation)** | 🏆 Ready |
