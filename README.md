

# Static server

## Подготовка

Перед тем как собрать образ и запустить контейнер, необходимо создать ssh ключи для пользователей, которые будут использоваться для подключения к серверу.

Ниже приведен пример создания ключей для пользователя `deployer`:
```bash
$ ssh-keygen -t rsa -b 4096 -C "deployer" -N "" -f ~/.ssh/id_rsa_deployer
Generating public/private rsa key pair.
Your identification has been saved in /Users/konstantin/.ssh/id_rsa_deployer
Your public key has been saved in /Users/konstantin/.ssh/id_rsa_deployer.pub
The key fingerprint is:
SHA256:wqX/0tgFDnG77N3Zat6JY4NYvQ/OoYWlhdvOwPE+zDo deployer
The key's randomart image is:
+---[RSA 4096]----+
|                 |
|        . .      |
|        .o .     |
|     . o. o .    |
|      + S+ =.o   |
|       o  =.@.   |
|        .=oO+B.o |
|        oo+E@OB.o|
|         ..o+XB+.|
+----[SHA256]-----+
```

Скопировать содержимое публичных ключей в файл для определения пользователей `ansible/roles/users/vars/main.yml`

```bash
$ cat ~/.ssh/id_rsa_deployer.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDX8Q0WmNXU1U9zE6Q7H07OKtg5q2psEqQQhiTWsJbTj6KO07NZS4KO23C1BLdQQJ16Zy8gaJCGWNDVq7MWRqSLpWKzSJfqJ7Jyg9gxGeVLg+J42WQLpWyvlUTsQM3MYWfW7zNRg4Xy9RgIrgo0yNwZn1B7ageI62q3O5soqwj+WV4mJZnD+ukaJDLtuR2W5vJt0nwtBqVmOV+BU4JlY5egMBdIysxhlzrt0NznK3QPIbr7b2QW4r6XLrxgszwyRsbjMrXICftSraSSGd9KmPs7KpRf+t/fzW6C49DRF4F2HGh0H4C/q0kqOJoM18mJOyoMHBZ5hEL+gUxgFykYtOFJyqq45GYiX2I6RgW0EiNlvk2CjdhmLAvFEMWmQuupToFYycgVPZCOTTxJU2VAtBNNAwM+i6MDc5L0vNjEZzb/b/DHys7KBbqNkzz6fWT6ZGh/psy6PjMwsK9TO3cKCVMuXwR9eT8mr2T+saJDWqgnPTYxQzZiCd0JR8JNQXjUtgrQXt3MQeJcHPp5J9YDhn29qJCp43wV9sNfwasZPs4YjH1mG6Bt8Up+Xai0J04lpA6OP1jiEVwW7WcdPMdSHfjZ5ZP78qZYWeRAAXCyNxwujK4sXDB0+b8D8W1wGwnYV3JsczcjBr7J+wZA91Lod68m3VMXEdLhjw1FxJScQjJfyQ== deployer
```

После того как все пользователи определены, можно собрать образ и запустить контейнер.

## Сборка образа и запуск контейнера

Для сборки образа используется Makefile, который содержит команды для сборки образа и запуска контейнера.

```bash
$ make build
```

## Запуск контейнера без сборки образа

```bash
$ make up
```

## Применение плейбука

Для применения плейбука необходимо выполнить команду:

```bash
$ make playbook
```

После выполнения плейбука, можно проверить работу сервера, перейдя по адресу http://localhost/images

Так же можно проверить работу сервера, подключившись к контейнеру по ssh:

```bash
$ make ssh user=deployer
```
