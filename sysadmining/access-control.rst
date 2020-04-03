==============
Access Control
==============

Access control focuses on how the kernel and its delegates manage security-related
decisions.

To determine the ownerships of a file::

  $ ls -l <my-file>

The root account
----------------

Logging directly into the root account leaves no log of what command were
performed as root. Instead it's better to use the `su` command - if used without 
arguments, it prompts the user for the root password and starts a root shell. It
doesn't log the commands executed as root, but it does record who became root and 
when. 

An alternative to ``su`` is ``sudo``, which acts as limited ``su``. ``sudo`` takes
as its argument, a command to be executed as root. Before a command is executed, the
``etc/sudoers`` file is consulted and if the user is listed there, they will be asked
for their password in order to run the command. 

Namespaces
----------

Namespaces are used to separate processes into hierarchical partitions. Within these
namespaces, processes can see only a subset of files, ports and processes. 

This is one of the bases of software containerisation e.g. Docker. 

