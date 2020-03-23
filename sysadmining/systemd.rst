=======
systemd
=======

`systemd` is a collection of libraries, daemons, programs and kernal components.
used for system management for Linux operating systems.

Any entity managed by systemd is known as a ``unit``.

`systemctl` is a command for managing systemd.

System logs are captured by `journald` and the command `journalctl` can be used
to interact with them.

Useful commands
===============

Show loaded and active services::

  $ systemctl list-units --type=service

To see all installed unit files, regardless or whether or not they're active::

  $ systemctl list-unit-files --type=service

See the status of a service::

  $ systemctl status -l kubelet.service

where ``-l`` is used to request full log entries 

Restart a service::

  $ systemctl restart <service>

Display logs for a specific service::

  $ journalctl -u <service> --since "2019-10-16 00:00:00"

Display kernel messages with ``-k`` flag::

  $ journalctl -K --since "10 minutes ago"

Follow (``-f``) from end of last boot (``-e``), and augment log messages
with message catalog data (``-x``)::

  $ journalctl -xef -u <service>

Reference
---------

`Unix and Linux System Administration Handbook`_

.. _Unix and Linux System Administration Handbook: https://www.goodreads.com/en/book/show/8772005-unix-and-linux-system-administration-handbook 

