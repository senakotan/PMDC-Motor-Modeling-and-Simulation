%% Simulink – Hız (N, rpm) ve Akım Grafiği
N_sl_rpm = w_sl * 60 / (2*pi);   % rad/s -> rpm

figure;

yyaxis left
plot(t_sl, N_sl_rpm, 'LineWidth', 1.4);
ylabel('Hız N (rpm)');
grid on;

yyaxis right
plot(t_sl, ia_sl, '--', 'LineWidth', 1.4);
ylabel('I_a (A)');

xlabel('Zaman (s)');
title('Simulink Modeli – N ve Akım');
legend('Hız (rpm)', 'Armatür Akımı', 'Location', 'best');


