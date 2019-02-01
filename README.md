# convert-feed

Утилита принимает на вход rss или atom, выполняет некоторые манипуляции (если указано) и на выходе выдает также rss или atom. В манипуляции входят следующие задачи:

```
Usage: /usr/local/bin/convert-feed [options]
    -r, --[no-]reverse               Revers items
    -s, --[no-]sort                  SortForRss items
    -o, --out FORMAT                 Output feed format: atom/rss 
    -h, --help                       Show help message
    
```

Вывод результата просиходит в STDOUT и в файл `output`. Исходный `input` может быть локальным файлом, так и http адресом по которому нужно его забрать.

## Пример использования:
```
$ convert-feed --out rss feed.xml
$ convert-feed --out atom https://ru.hexlet.io/lessons.rss
```
