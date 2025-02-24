# Handwriting-Recognition
📝 Handwriting Recognition System
This project implements a handwriting recognition system using MATLAB and a deep learning-based classification model. The system captures an image from a webcam, processes it, and classifies the handwriting signature using a pre-trained neural network.

📌 Features
📷 Image Capture: Uses a webcam to capture handwritten signatures.
🖥 Deep Learning Model: Loads a trained neural network for handwriting classification.
📊 Accuracy Calculation: Computes a confidence score for recognition.
📂 Data Logging: Saves the recognition results to an Excel file.
🌐 IoT Integration: Sends results to a cloud server via ThingSpeak.
🚀 How It Works
Capture Image: The system initializes the webcam and captures a 400x400 image of the signature.
Preprocess Image: Resizes and stores the image for further processing.
Load Neural Network: Loads a pre-trained deep learning model for classification.
Classify Signature: The system predicts whether the signature is valid and calculates a confidence score.
Save Results: Saves the recognition results into an Excel sheet.
IoT Connectivity: Sends data to ThingSpeak for online monitoring.
📁 Project Structure
graphql
複製
編輯
📂 ProjectSignature
 ├── 📜 D0965676_5.m           # Main MATLAB script for recognition
 ├── 📂 pic                    # Folder storing captured images
 ├── 📂 Net                    # Pre-trained neural network files
 ├── 📂 segnet                 # Segmentation network files
 ├── 📂 excel                  # Folder storing recognition results
 │   ├── Certification.xlsx    # Excel file storing recognition data
 │   ├── test.jpg              # Test output image
⚙️ Requirements
MATLAB
Deep Learning Toolbox
Image Processing Toolbox
Excel (for data logging)
Internet Connection (for IoT functionality)
🛠 Usage
Run the MATLAB script:
matlab
複製
編輯
run('D0965676_5.m')
The system will:
Capture and process the handwriting image.
Classify the signature and display the result.
Save the accuracy score to an Excel sheet.
Upload data to ThingSpeak.
📡 IoT Integration
The script updates a ThingSpeak channel to report recognition results:
✅ Field2 = 1 → Signature recognized successfully.
❌ Field2 = 0 → Signature not recognized.
📝 Future Improvements
🔄 Enhance accuracy using a larger dataset.
🎨 Improve segmentation for better signature recognition.
☁️ Integrate cloud-based AI models for real-time recognition.
