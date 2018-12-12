# sudoers.d files
The files that you want to be active need to be copied to the systems
`/etc/sudoer.d` directory. 

From an existing root shell run `chmod -c 0440 /etc/sudoers.d/*`.

This assumes that /etc/sudoers has the `#includedir /etc/sudoers.d` processing directive.
