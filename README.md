command_watcher
===============

UNIX コマンドを定期的に実行し Web に出力する


## 使い方


lib/app.rb の
```bash
command = 'unix_command'
```
unix_command の部分に実行したコマンドを記述します。

その後、
```bash
BASIC_AUTH_USERNAME=testuser BASIC_AUTH_PASSWORD=testpass bundle exec rackup
```
で実行します。

```lib/app.rb:bash
refresh_seconds = 4
```
refresh_seconds は指定された時間でブラウザを refresh します。