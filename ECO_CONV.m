% PMCD - Práctica 2 - ECO por convolución

clear all; close all; clc;

% Parámetros
Fs = 44100;               % Frecuencia de muestreo
atraso_seg = 0.5;         % Retardo del eco en segundos
N = round(Fs * atraso_seg); % Retardo en muestras

% Cargar señal grabada
load('MiGrabacion.mat');
x = getaudiodata(grabacion);

% Crear respuesta al impulso teórica h[n] = i[n] + α·i[n - N]
h = zeros(1, N + 1);
h(1) = 1;        % h[0] = 1
h(N + 1) = 0.5;  % h[N] = 0.5

% Aplicar convolución
y = conv(x, h);

% Reproducir salida
sound(y, Fs);

% Gráficas
figure;
subplot(2,1,1);
plot(x);
title('Entrada: Señal de voz');
xlabel('Muestras (n)'); ylabel('x[n]');

subplot(2,1,2);
plot(y);
title('Salida: Señal con eco (convolución)');
xlabel('Muestras (n)'); ylabel('y[n]');

figure;
n = 0:N;  % vector de índices
stem(n, h);
title('Respuesta al impulso del sistema (eco)');
xlabel('n'); ylabel('h[n]');

