% Script para grabar voz, escucharla, graficarla y guardarla

clear all; close all; clc;

% Parámetros de grabación
Fs = 44100;             % Frecuencia de muestreo
duracion = 5;           % Duración de grabación en segundos
nBits = 16;             % Resolución de audio
nCanales = 1;           % Mono

% Crear objeto de grabación
grabacion = audiorecorder(Fs, nBits, nCanales);

% Instrucciones al usuario
disp('Presiona ENTER para comenzar la grabación...');
pause;
disp('Grabando...');
recordblocking(grabacion, duracion);
disp('Grabación finalizada.');

% Reproducir audio grabado
disp('Reproduciendo...');
play(grabacion);

% Obtener datos como vector
miVoz = getaudiodata(grabacion);

% Graficar la señal
figure;
plot(miVoz);
title('Señal de voz grabada');
xlabel('Muestras');
ylabel('Amplitud');

% Guardar archivo
save('MiGrabacion.mat', 'grabacion');
disp('Grabación guardada como "MiGrabacion.mat"');
