# E-Kermit
EK (Embedded Kermit, E-Kermit) is an implementation of the Kermit file transfer protocol written in ANSI C and designed for embedding in devices or firmware, for use in realtime applications, or for construction of DLLs and libraries. EKSW is a new version of E-Kermit that includes true sliding windows packet transport. EK and EKSW should be reconciled back into a single code base but so far that has not happened.

## What E-Kermit does
EK performs just two functions: sending files and receiving files. It is compact, portable, and fully reentrant. On SPARC (RISC), kermit.o is about 25K. On Intel (CISC) it's about 15K. By reducing buffer sizes and eliminating optional or unwanted features, smaller sizes can be achieved.

## What E-Kermit does NOT do
EK does not include client/server functions; a command or script programming language; character-set conversion; transport encryption; or any form of communications or file input/output. It does not dial modems, it does not make connections, it does not have a built-in TCP/IP stack or interface to an external one. If you need these features, then you should use a full Kermit program, such as [C-Kermit](https://www.kermitproject.org/ckermit.html) or [Kermit 95](https://www.kermitproject.org/k95.html). 

---

EK is not an application itself, it's a subroutine to be called from your master application. It is useful only to developers, who must supply the master application or calling environment as well as the file and communications i/o routines. The calling environment must, in turn, make and configure the communications connection if one is required and not already open. A sample calling environment and i/o support are provided for Unix.

Customers have adapted EK to various environments and platforms, including the Palm Pilot, various kinds of technician equipment (e.g. for diagnosis and maintenance of cell phone towers), and sometimes they contribute their adaptations or i/o routines, and we can make these available on a strictly as-is basis. We are not able to support or maintain customer-contributed code; thus (for example) if a new version of EK is released, customer-contributed modules are not necessarily updated. Customer-contributed code includes:

* Microsoft Windows 9x/ME/NT/2000/XP/Vista/7 serial-port and file i/o for EK 1.3 and later.
* Wind River VxWorks for EK 1.1.
* EK 1.2 translated into Java. 

### EK includes the following Kermit Protocol features:

* Long packets
* Sliding windows with Go-Back-to-N error recovery (true selective repeat in EKSW).
* Repeat-count compression
* Control-character prefixing and unprefixing
* 8th-bit prefixing (for transferring 8-bit data on 7-bit links) (= parity)
* Attribute packets (type, size, and date)
* Sending and receiving single or multiple files.
* Automatic per-file text/binary mode switching.
* All three block check types (6- and 12-bit checksum, 16-bit CRC).
* Status reports (protocol state, file name, size, timestamp, bytes so far).
* Transfer cancellation by either party. 

### The following Kermit Protocol features are not implemented:

* Sliding windows with selective retransmission (except in EKSW)
* Character sets
* Locking shifts
* Client/server 

Timeouts would be the responsibility of the Kermit program on the other end of the connection or, if needed in E-Kermit itself, the platform-dependent packet-reading routine which you would write. 
