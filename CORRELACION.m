% Práctica 2 - correlación cruzada
% PMCD

clear all; clc; close all;

% Cargar las señales
load CorrelacionCruzada;

% Asignar variables para claridad
x = FraseApertura;
y = Intento1;
a = Intento2;
b = Intento3;
c = Intento4;

% Calcular autocorrelación
autocorr = xcorr(x, x);
figure;
stem(autocorr);
title('Autocorrelación de la frase de apertura');
xlabel('Lags'); ylabel('Coeficiente');

% --- Intento 1 ---
[corrcruz, eje] = xcorr(x, y);
figure;
subplot(2,1,1);
stem(corrcruz, 'r'); title('Intento 1 - Correlación cruzada');
xlabel('Lags'); ylabel('Coeficiente');

normal = corrcruz / max(autocorr) * 100;
similitud1 = max(normal);

subplot(2,1,2);
stem(eje, normal, 'r'); title(['Intento 1 - Normalización (%), Similitud = ', num2str(similitud1, '%.2f'), '%']);
xlabel('Lags'); ylabel('Similitud (%)');

% --- Intento 2 ---
[corrcruz, eje] = xcorr(x, a);
figure;
subplot(2,1,1);
stem(corrcruz, 'g'); title('Intento 2 - Correlación cruzada');

normal = corrcruz / max(autocorr) * 100;
similitud2 = max(normal);

subplot(2,1,2);
stem(eje, normal, 'g'); title(['Intento 2 - Normalización (%), Similitud = ', num2str(similitud2, '%.2f'), '%']);

% --- Intento 3 ---
[corrcruz, eje] = xcorr(x, b);
figure;
subplot(2,1,1);
stem(corrcruz, 'y'); title('Intento 3 - Correlación cruzada');

normal = corrcruz / max(autocorr) * 100;
similitud3 = max(normal);

subplot(2,1,2);
stem(eje, normal, 'y'); title(['Intento 3 - Normalización (%), Similitud = ', num2str(similitud3, '%.2f'), '%']);

% --- Intento 4 ---
[corrcruz, eje] = xcorr(x, c);
figure;
subplot(2,1,1);
stem(corrcruz, 'k'); title('Intento 4 - Correlación cruzada');

normal = corrcruz / max(autocorr) * 100;
similitud4 = max(normal);

subplot(2,1,2);
stem(eje, normal, 'k'); title(['Intento 4 - Normalización (%), Similitud = ', num2str(similitud4, '%.2f'), '%']);

% --- Evaluación final ---
[sim_max, intento_correcto] = max([similitud1, similitud2, similitud3, similitud4]);
fprintf('\n🔐 El intento correcto es: Intento %d con %.2f%% de similitud\n', intento_correcto, sim_max);
