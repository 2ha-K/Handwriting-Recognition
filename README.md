# ProjectSignature — Handwriting (Signature) Recognition System

This project implements a handwriting signature recognition system using MATLAB, deep learning-based classification, and segmentation models.  
It supports multiple input sources (webcam, file selection, mobile capture) and integrates with IoT (ThingSpeak) for online result reporting.

---

## 📌 Key Features
- **Multiple Input Sources**
  - Webcam: Capture live image
  - File Selection: Choose an existing image
  - Mobile/External Capture: Upload an image to MATLAB for processing
- **Deep Learning Models**
  - Classification (`myNet`): Determines if the signature is `true` or `fake`
  - Segmentation (`myNet2`): Locates and highlights the signature area
- **Model Usage**
  - Models are trained in MATLAB and saved as `.mat` files
  - They are loaded from local storage when running recognition scripts
  - **No need to re-train every time** — just load the saved `.mat` model
- **Result Logging**
  - Saves classification confidence scores to an Excel file
  - Stores processed image with result overlay
- **IoT Integration**
  - Sends recognition results to ThingSpeak for online monitoring
  - `Field2 = 1` → Signature recognized successfully
  - `Field2 = 0` → Signature not recognized

---

## 📂 Project Structure
```

ProjectSignature/
├── D0965676\_5.m                 # Webcam recognition script
├── D0965676\_4.m                 # File selection recognition script
├── camera\_classify\_thingspeak.m # Mobile capture + IoT upload script
├── D0965676\_3.m                 # Classification model training
├── D0965676\_2.m                 # Segmentation model training
├── Net/                         # Saved classification models (.mat)
├── segnet/                      # Saved segmentation models (.mat)
├── pic/                         # Captured or selected images
├── excel/                       # Excel logs and saved output images
│   ├── Certification.xlsx
│   └── test.jpg

````

---

## ⚙️ Requirements
- MATLAB (GPU support recommended for training)
- Deep Learning Toolbox
- Image Processing Toolbox
- Microsoft Excel (for result logging)
- Internet Connection (for ThingSpeak IoT functionality)

---

## 🚀 Usage

### 1️⃣ Prepare the Models
Make sure you have trained and **saved**:
- Classification model → `Net/myNetXXXXX.mat`
- Segmentation model → `segnet/myNetXXXXX.mat`

> 💡 Models are trained in MATLAB and saved manually using:
> ```matlab
> save('Net/myNetXXXXX.mat', 'myNet', '-v7.3');
> save('segnet/myNetXXXXX.mat', 'myNet2', '-v7.3');
> ```

### 2️⃣ Choose Input Method
- **Webcam** → `D0965676_5.m`
- **File Selection** → `D0965676_4.m`
- **Mobile/IoT** → `camera_classify_thingspeak.m`

### 3️⃣ Run in MATLAB
Example:
```matlab
run('D0965676_5.m')
````

### 4️⃣ Process Flow

1. Capture or load the image
2. Resize to `[400, 400]`
3. Load `.mat` models from local storage
4. Classify (`true`/`fake`) and calculate confidence score
5. Segment the signature area
6. Save results to Excel and `test.jpg`
7. (Optional) Upload result to ThingSpeak

---

## 📡 IoT Integration

ThingSpeak is used to report recognition results:

* `Field2 = 1` → Signature recognized successfully
* `Field2 = 0` → Signature not recognized

---

## 🔮 Future Improvements

* Improve classification accuracy with a larger, more diverse dataset
* Enhance segmentation precision
* Integrate cloud-based AI models for real-time mobile processing
* Add decision fusion: combine classification and segmentation thresholds

---

## 📝 Notes

* This project assumes you **already have trained `.mat` models** saved locally.
* If you need to retrain:

  * Classification → `D0965676_3.m`
  * Segmentation → `D0965676_2.m`
* Models are **loaded from MATLAB local storage**, not exported to a fixed folder during training.
  Save them manually after training to `Net/` or `segnet/`.

---

**Author:** \[PO-YI, LIN]
**Project:** Handwriting-Recognition


而且清楚提到模型是訓練完先存起來，使用時從 MATLAB 本地載入，而不是每次重訓。  

如果你願意，我可以幫你在這個 `README.md` 裡加一段**「快速開始」**章節，教使用者 3 步完成辨識，你要我加嗎？
```
