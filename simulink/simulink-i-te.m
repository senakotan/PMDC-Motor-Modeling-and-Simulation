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

set(gcf, 'Color', 'w');   % Figure arka planı
set(gca, 'Color', 'w');   % Grafik alanı (axes)

