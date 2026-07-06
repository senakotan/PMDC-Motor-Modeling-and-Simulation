%% ZAMAN VEKTÖRLERİNİ OLUŞTUR
T = 3;                        % Simülasyon süresi (s) → Doğrudan yazıyoruz

N_sl = length(ia_sl);         % Simulink örnek sayısı (65)
N_ss = length(ia_ss);         % Simscape örnek sayısı (270)

t_sl = linspace(0, T, N_sl).';   % Simulink zamanı (65x1)
t_ss = linspace(0, T, N_ss).';   % Simscape zamanı (270x1)


%% Simulink – Akım ve Tork Grafiği
figure;

yyaxis left
plot(t_sl, ia_sl, 'LineWidth', 1.4);
ylabel('I_a (A)');
grid on;

yyaxis right
plot(t_sl, te_sl, '--', 'LineWidth', 1.4);
ylabel('T_e (N·m)');

xlabel('Zaman (s)');
title('Simulink Modeli – Akım ve Tork');
legend('Armatür Akımı', 'Elektromanyetik Tork', 'Location', 'best');

% Arka planı beyaz yap (rapor için)
set(gcf, 'Color', 'w');
set(gca, 'Color', 'w');
