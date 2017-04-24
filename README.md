
Sound Source Detection Using Machine Learning

In this project we used a microcontroller (ARM M-4) to detect sound from microphones and predict the time delay/angle of the source 
using Machine Learning. 

Getting Started

The code for the C programming is done in PSOC and is not published in this repository as it is 
a property of the Analog Lab at Columbia University. However, the MATLAB code provides UART detection and Machine learning analysis. 

Prerequisites

MATLAB is the only software required for this part of the project. 

Examples and Discussion

The data is read over universal asynchronous receiver/transmitter (UART) 
using a serial port over MATLAB. The first half of the class prediction file contains the code for 
the sampling instructions as well as port settings to read the data.

In datalabeled.m The data is collected for various different angles to build the training set. 
This was done by placing microphones at numerous positions (making up the classification labels).

The rest of classprediction.m uses the K-NN algorithm package in MATLAB to load the training set and 
build the classification model.

Authors

Rikin Mathur
Daniel De Godoy Poxieto
