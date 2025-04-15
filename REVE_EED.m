% PMCD - Práctica 2 - Reverberación por ecuación en diferencias

clear all; close all; clc;

% Cargar señal grabada
load('MiGrabacion.mat');
x = getaudiodata(grabacion);
Fs = 44100;

% Parámetros de reverberación
alpha = 0.6;                % Coeficiente de retroalimentación
retardo_ms = 40;            % Retardo en milisegundos
d = round((retardo_ms/1000) * Fs);  % Retardo en muestras

N = length(x);
y = zeros(1, N);            % Inicializar salida

% Aplicar ecuación en diferencias
for n = 1:N
    if n > d
        y(n) = x(n) + alpha * y(n - d);
    else
        y(n) = x(n);  % Las primeras muestras no tienen retroalimentación
    end
end

% Reproducir salida reverberada
sound(y, Fs);

% Gráficas
figure;
subplot(2,1,1); plot(x); title('Entrada: señal de voz'); xlabel('Muestras'); ylabel('Amplitud');
subplot(2,1,2); plot(y); title('Salida: reverberación (ecuación en diferencias)'); xlabel('Muestras'); ylabel('Amplitud');
