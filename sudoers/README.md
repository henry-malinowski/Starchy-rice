# sudoers.d files
This assumes that /etc/sudoers has the `#includedir /etc/sudoers.d` processing directive.

An examples of installing two files would be...

```sh
cd ./etc/sudoers.d
sudo install -m 0440 010_easier-sudo-group 020_custom-prompt -t /etc/sudoers.d
```

