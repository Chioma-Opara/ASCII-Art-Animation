# ASCII Art Music Video 🎵🖋️  
*Final Project — Animated ASCII Art with Music Synchronization*

## 🧠 Overview

This project takes the classic idea that “a picture is worth a thousand words” quite literally—by building not just a static image, but an entire video using text characters. It combines animated ASCII art with synchronized audio to simulate the experience of a music video.

What started as a fun exploration of matrix transformations became a creative way to think about educational accessibility. This lightweight visual system could be expanded into low-bandwidth learning tools for children in rural or resource-constrained settings.

---

## 🎯 Project Goals

- Build modular ASCII animations using character matrices
- Synchronize each animation segment with an accompanying audio track
- Use transition sound effects for a smooth, cohesive video experience

---

## 📂 Folder Structure

```plaintext
.
├── lab01_free.m                  # Entry point – run this to start the animation
├── animateAsciiShow.m           # Main animation engine: runs all effects + audio
├── img2txt.m                    # Converts an image to ASCII .txt
├── setupAsciiDisplay.m         # Initializes the figure and loads ASCII text
├── scrollOneStep.m             # Frame-by-frame scroll logic
├── scroll.m                    # Full scroll animation
├── waveEffect.m                # Wave distortion effect
├── dance.m                     # Shake/dance animation
├── transition.m                # Transition between two ASCII images
├── ZoomOut.m                   # Zoom-out ASCII effect
├── fadeInOutAudio.m            # Applies fade-in and fade-out to audio
├── audio/                      # Contains .wav and .mp3 files for each animation and transition
├── images/                     # Contains source images
├── ascii/                      # Contains ASCII-converted .txt files
└── final_output.mp4            # Exported video output (if saved)
```

---

## ▶️ How to Run

1. Open MATLAB.
2. Make sure all files are in your working directory.
3. Run:

```matlab
lab01_free
```

This will call `animateAsciiShow(...)`, which combines the animations and audio into a full presentation inside a figure window.

---

## 🔧 Key Components

### ASCII Art
- Created using `img2txt.m`, which converts images into text-based matrices.
- Displayed using a `uicontrol` in a MATLAB figure.

### Audio Synchronization
- Audio is loaded using `audioread` and played with `audioplayer`.
- Each animation has a corresponding audio clip with fade-in/out support.
- Transition sounds (e.g. bells, swooshes) are added between segments.

### Modular Animations
- Each animation (scroll, wave, dance, zoom, transition) is in a separate `.m` file.
- `scrollOneStep.m` allows frame-by-frame audio syncing.
- All effects are called and sequenced inside `animateAsciiShow`.

---

## 🧪 Sample Custom Call

You can modify `lab01_free.m` to run different input images or adjust replay loops:

```matlab
animateAsciiShow('image.jpg', 'flowerpot2.jpg', 2)
```

- `image.jpg`: source image 1
- `flowerpot2.jpg`: optional image for transition
- `2`: number of replays

---

## 🚧 Known Limitations

- Animation durations are hardcoded to match the current audio clips.
- Audio events (like beats) don’t yet dynamically trigger visual effects.
- Transition sounds are manually placed and not data-driven.

---

## 🚀 Future Improvements

- Detect beats or audio changes to trigger effects in real time.
- Dynamically adjust animation timing to fit arbitrary audio clips.
- Add interactivity or allow users to build their own animation sequences.
- Adapt for real-time webcam-to-ASCII streaming.

---

## 💡 Educational Relevance

- Introduces students to matrix transformations through visual media.
- Offers a lightweight model for delivering educational content in low-bandwidth environments.
- Demonstrates audio-visual synchronization concepts in a low-resource format.

---

## 📚 Resources

- [MATLAB Documentation](https://www.mathworks.com/help/)
- [Mixkit.co](https://mixkit.co) — free sound effects
- [Pixabay](https://pixabay.com) — open-license music
- [ChatGPT](https://chat.openai.com) — debugging and design support

---

## 👩🏽‍💻 Author

**Chioma Opara**  
Smith College, Class of 2027  
Project submitted for MTH 261 Final (Spring 2025)
