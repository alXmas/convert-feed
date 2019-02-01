# convert-feed
Утилита принимает на вход rss или atom, выполняет некоторые манипуляции (если указано) и на выходе выдает также rss или atom. В манипуляции входят следующие задачи:

Usage: /usr/local/bin/convert-feed [options]
    -r, --[no-]reverse               Revers items
    -s, --[no-]sort                  SortForRss items
    -o, --out FORMAT                 Output feed format: atom/out_rss 
    -h, --help                       Show help message

Утилита выводит результат в STDOUT. Исходный feed может быть локальным файлом, так и http адресом по которому нужно его забрать.

Примеры:
$ convert-feed --out rss feed.xml
$ convert-feed --out atom https://ru.hexlet.io/lessons.rss
