# sudoers.d files
This assumes that /etc/sudoers has the `#includedir /etc/sudoers.d` processing directive.

An examples of installing two files would be...

```sh
cd ./etc/sudoers.d
sudo install --mode=0440 010_easier-sudo-group 010_no-tty-tickets 020_custom-prompt --target-directory=/etc/sudoers.d
```

