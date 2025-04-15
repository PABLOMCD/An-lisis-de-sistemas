% PMCD - Práctica 2 - Reverberación por convolución 

clear all; close all; clc;

% Cargar señal grabada
load('MiGrabacion.mat');
x = getaudiodata(grabacion);
Fs = 44100;

% Parámetros de reverberación
num_rebotes = 5;
retraso = round(0.04 * Fs);  % 40 ms entre rebotes
coef = 0.6;                  % Atenuación progresiva

% Crear respuesta al impulso del sistema de reverberación
h = zeros(1, retraso * num_rebotes + 1);
for i = 0:num_rebotes
    h(i * retraso + 1) = coef^i;   % Cada rebote atenuado y desplazado
end

% Aplicar convolución
y = conv(x, h);

% Reproducir señal reverberada
sound(y, Fs);

% Gráficas
figure;
subplot(2,1,1);
plot(0:length(x)-1, x);
title('Entrada: señal de voz');
xlabel('n'); ylabel('x[n]');

subplot(2,1,2);
plot(0:length(y)-1, y);
title('Salida: reverberación (por convolución)');
xlabel('n'); ylabel('y[n]');

% Gráfica de la respuesta al impulso con n desde 0
figure;
n = 0:length(h)-1;  % Vector de índices teóricos
stem(n, h);
title('Respuesta al impulso del sistema (reverberación)');
xlabel('n'); ylabel('h[n]');

