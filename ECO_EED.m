% Pablo McD - Práctica 2 - ECO por ecuación en diferencias

clear all; close all; clc;

% Parámetros del eco
k = 22050;     % Retardo en muestras (0.5 segundos a 44100 Hz)
bk = 0.5;      % Atenuación del eco

% Cargar la grabación
load('MiGrabacion.mat');
x = getaudiodata(grabacion);
Fs = 44100;    % Frecuencia de muestreo

N = length(x);          % Tamaño de la señal original
temp = zeros(1, k);     % Memoria de retardo
y = zeros(1, N + k);    % Salida extendida
j = 1;

% Aplicar la ecuación en diferencias
for i = 1:N
    y(i) = x(i) + bk * temp(j);
    temp(j) = x(i);
    j = mod(j, k) + 1;   % Ciclar el buffer circular
end

% Agregar el eco final que sigue sonando
for i = N+1:N+k
    y(i) = bk * temp(j);
    j = mod(j, k) + 1;
end

% Reproducir señal con eco
sound(y, Fs);

% Gráficas
figure;
subplot(2,1,1); plot(x); title('Entrada: Señal de voz'); xlabel('Muestras'); ylabel('Amplitud');
subplot(2,1,2); plot(y); title('Salida: Señal con eco (ecuación en diferencias)'); xlabel('Muestras'); ylabel('Amplitud');
