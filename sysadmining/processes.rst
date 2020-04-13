=========
Processes
=========

A process consists of a memory address and a set of data structures within the
kernel. The address space is a set of memory pages that the kernel marks for 
the process's use.

Certain pieces of information about the process is noted by the kernel's
internal data structures, such as:

- the processes address space map
- current process status
- execution priority
- info about resources used by process as well as ports and files
  it has opened
- process's signal mask
- process owner

Each process has at least one thread (i.e. an execution context). Each
thread will have its own stack and CPU context.

Compontents of a Process
------------------------

- Process ID number (PID)
- Parent ID (PPID)
- ID of user who created it (UID) and effective user ID (EUID)
- Group ID of process (GID) and Effective GID (EGID)
- Niceness 

Signals
-------

Signals are process-level interrupt requests. There are ~30 defined signals.

Notable differences between ``KILL`` ``INT``, ``TERM`` and ``QUIT``::

  KILL - unblockable and terminates process at kernel level
  INT - sent by terminal driver when user enters 'ctrl-c'
  TERM - blockable request to terminate immediately
  QUIT - similar to TERM, but processes a core dump if not caught

The command `kill` can be used to terminate a process in the terminal i.e.::

  $ kill <pid> 

By default it sends a ``TERM`` signal, but it has the option to take the number
or name of the signal to send e.g.``kill -9 <PID`` would use ``KILL``.

Process Overview
----------------

The command ``ps`` can be used to monitor processes.

To view all processes (``a``) in a user-focused (``u``) format, even if
they don't have a control terminal (``x``), use::

  $ ps aux

or::

  $ ps lax

(long format)

Proc Files
----------

``/proc`` is a filesystem that exposes information about the system's state. 

Trace signals
-------------

In order to observe what a process is doing, at a finer level, ``strace`` can
be used. This will display each system call a process makes and signal
received. It can be used like::

  $ strace -p <pid>

