===============
The File System
===============

The filesystem has four primary components:

- A namespace
- An API
- Security models for protecting and sharing info
- An implementation

Mounting the Filesystem
-----------------------

The filesystem is composed of filesystems (i.e. sub-directories and files).
In order to attach a file system to the overall system, the ``mount`` command
is used to map a directory to an existing file system (i.e. mount point) at
the root of the joining-file system.

The ``/etc/fstab`` file lists filesystems that are usuall mounted on the
system.

To detach filesystems the ``umount`` command is used. If a filesystem is busy
and cannot unmount, using the following command prints each PID that's using
that filesystem::

  $ fuser -c <filesystem>

and to investigate these PIDs further i.e. see user, started::

  $ ps up "<PID1> <PID2> <PID3>..."

File Types
----------

There are several different file types. The type of an existing file can be
determined with the ``file`` command. 

Useful file types to know and their symbols::

  regular, -
  directory, d
  character device, c
  block device, b
  named pipe, p
  symbolic link, l
  local domain socket, s

Hard links can be created like ``ln <old> <new>``, which makes
``new`` an additional reference to ``old``. 

Permission Bits
---------------

Nine permission bits are used to determine what can be performed on a file and
by whom: the first three are for the owner, the next are for group owners of
the file, and the last three are for everyone else. You can see these in the
output of ``ls -l <file>``.

To change permissions, ``chmod`` is used, with the permissions::

  Binary   Permissions
  000      ---
  001      --x
  010      -w-
  011      -wx
  100      r--
  101      r-x
  110      rw-
  111      rwx

i.e. ``chmod 710`` gives full permission to owner, execute-only to group,
and no permissions to everyone else.

Changing File Attributes
-------------------------

The commands ``lsattr`` and ``chattr`` can be used to list and change
the atrributes of files.

