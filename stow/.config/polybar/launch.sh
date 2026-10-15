#!/usr/bin/sh

# 1. Завершаем все запущенные экземпляры polybar, чтобы не было дублей.
#    Безопасно: просто останавливает старые процессы polybar.
polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar_master.log /tmp/polybar_slave.log

# 2. Определяем главный (primary) монитор через xrandr.
#    Безопасно: только чтение информации о дисплеях.
PRIMARY_MONITOR=$(xrandr --query | awk '/ primary/{print $1}')

# 3. Если по какой-то причине primary не найден (например, не установлен),
#    берём первый монитор из списка как запасной вариант.
#    Безопасно: fallback-логика, не изменяет систему.
if [ -z "$PRIMARY_MONITOR" ]; then
    PRIMARY_MONITOR=$(polybar --list-monitors | head -n1 | cut -d":" -f1)
fi

# 4. Получаем список ВСЕХ подключённых мониторов.
#    Безопасно: только чтение.
ALL_MONITORS=$(polybar --list-monitors | cut -d":" -f1)

# 5. Запускаем bar "master" на главном мониторе.
#    Переменная MONITOR подставляется в конфиг polybar (monitor = ${env:MONITOR:}).
#    Потенциальный вред: нет, это просто запуск процесса от вашего пользователя.
MONITOR=$PRIMARY_MONITOR polybar --reload master 2>&1 | tee -a /tmp/polybar_master.log & disown

# 6. Перебираем остальные мониторы и запускаем на них "slave".
#    Если монитор только один, этот цикл просто не выполнится.
for monitor in $ALL_MONITORS; do
    if [ "$monitor" != "$PRIMARY_MONITOR" ]; then
        MONITOR=$monitor polybar --reload slave 2>&1 | tee -a /tmp/polybar_slave.log & disown
    fi
done

echo "Bars launched..."

