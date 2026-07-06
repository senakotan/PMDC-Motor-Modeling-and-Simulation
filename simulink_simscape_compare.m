%% PMDC Motoru – Simulink ve Simscape Karşılaştırması
% Bu kodu çalıştırmadan ÖNCE:
% 1) Simulink (denklem tabanlı) modeli çalıştırılmış olmalı -> w_sl, ia_sl, te_sl
% 2) Simscape modeli çalıştırılmış olmalı -> w_ss, ia_ss, te_ss
% t_end değişkeninde simülasyon süresi (örneğin 3 s) var.

%% ZAMAN VEKTÖRLERİNİ OLUŞTUR
T = 3;                        % Simülasyon süresi (s) → Doğrudan yazıyoruz

N_sl = length(ia_sl);         % Simulink örnek sayısı (65)
N_ss = length(ia_ss);         % Simscape örnek sayısı (270)

t_sl = linspace(0, T, N_sl).';   % Simulink zamanı (65x1)
t_ss = linspace(0, T, N_ss).';   % Simscape zamanı (270x1)

%% 1) Simulink sinyallerini Simscape zamanına yeniden örnekle (interpolasyon)
w_sl_i  = interp1(t_sl, w_sl,  t_ss, 'linear', 'extrap');
ia_sl_i = interp1(t_sl, ia_sl, t_ss, 'linear', 'extrap');
te_sl_i = interp1(t_sl, te_sl, t_ss, 'linear', 'extrap');

% Simscape sinyalleri zaten t_ss ile aynı uzunlukta
w_ss_i  = w_ss;
ia_ss_i = ia_ss;
te_ss_i = te_ss;

%% 2) Motor hızı karşılaştırması
figure;
subplot(3,1,1);

plot(t_ss, w_sl_i, 'LineWidth', 1.4); hold on;      % Simulink
plot(t_ss, w_ss_i, '--', 'LineWidth', 1.4);         % Simscape

grid on;
title('Motor Hızı Karşılaştırması');
xlabel('Zaman (s)');
ylabel('\omega (rad/s)');
legend('Simulink modeli', 'Simscape modeli', 'Location', 'best');

set(gcf, 'Color', 'w');   % Figure arka planı
set(gca, 'Color', 'w');   % Grafik alanı (axes)

%% 3) Armatür akımı karşılaştırması
subplot(3,1,2);

plot(t_ss, ia_sl_i, 'LineWidth', 1.4); hold on;
plot(t_ss, ia_ss_i, '--', 'LineWidth', 1.4);

grid on;
title('Armatür Akımı Karşılaştırması');
xlabel('Zaman (s)');
ylabel('I_a (A)');
legend('Simulink modeli', 'Simscape modeli', 'Location', 'best');

%% 4) Elektromanyetik tork karşılaştırması
subplot(3,1,3);

plot(t_ss, te_sl_i, 'LineWidth', 1.4); hold on;
plot(t_ss, te_ss_i, '--', 'LineWidth', 1.4);

grid on;
title('Elektromanyetik Tork Karşılaştırması');
xlabel('Zaman (s)');
ylabel('T_e (N·m)');
legend('Simulink modeli', 'Simscape modeli', 'Location', 'best');
