clear;
clc
close all

% --- 1. 初始化环境 ---
clear;
clc;
close all;

% --- 2. 录入无人机极坐标数据 ---
% 数据格式: [无人机编号, 半径r(m), 角度theta(°)]
drone_data = [
    0,   0,      0;
    1, 100,      0;
    2,  98,   40.10;
    3, 112,   80.21;
    4, 105,  119.75;
    5,  98,  159.86;
    6, 112,  199.96;
    7, 105,  240.07;
    8,  98,  280.17;
    9, 112,  320.28
];

% 提取编号、半径和角度
ids = drone_data(:, 1);
r = drone_data(:, 2);
theta_deg = drone_data(:, 3);

% --- 3. 将极坐标转换为笛卡尔坐标 ---
% 使用 sind 和 cosd 函数，它们直接接受角度作为输入
x = r .* cosd(theta_deg);
y = r .* sind(theta_deg);

% --- 4. 绘制位置图 ---
figure('Name', '无人机初始位置图');
hold on;

% 绘制所有无人机的位置点
% 使用 'p' 标记（五角星），设置标记大小和颜色
plot(x, y, 'p', 'MarkerSize', 12, 'MarkerFaceColor', '#0072BD', 'MarkerEdgeColor', '#0072BD');

% 为每个点添加其编号标签
% text 函数用于在指定坐标处添加文本
for i = 1:length(ids)
    % 在每个点的右上方一点的位置标注编号
    text(x(i) + 2, y(i) + 2, num2str(ids(i)), 'FontSize', 10, 'FontWeight', 'bold');
end

% --- 5. 美化图形 ---
hold off;
axis equal; % 保持坐标轴比例相等，使圆形看起来不会被压扁
grid on;   % 显示网格
box on;    % 显示坐标轴边框

title('无人机初始位置分布图', 'FontSize', 14);
xlabel('X 坐标 (m)', 'FontSize', 12);
ylabel('Y 坐标 (m)', 'FontSize', 12);
legend('无人机位置', 'Location', 'northeast');