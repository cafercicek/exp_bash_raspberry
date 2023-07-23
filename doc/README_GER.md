Es gibt zwei Arten von Zeitinformationen in den heutigen Computern. Die eine ist der Hardware-Timestamp und die andere ist die Systemuhr, die die globale Uhr anzeigt. Systemuhr: Die Systemuhr ist die globale Uhr, die für Zertifikatsprüfung und Protokollierung verwendet wird. Im Allgemeinen basiert die Quelle der Systemuhr auf einem externen Peripheriegerät namens "Real Time Clock" (RTC) zum Zeitpunkt des Systemstarts. Die RTC wird durch eine Batterie mit Strom versorgt und ist auch bei ausgeschalteter CPU in Betrieb.

Der Hardware-Timestamp zählt die Anzahl der internen Prozessortaktzyklen. Der Timestamp-Zähler ist eine spezielle Hardware-Ressource in einer CPU, auf die mit speziellen Befehlen zugegriffen werden kann. 


Das physische Zählregister CNTPCT_EL0 des Zähler-Timers der ARM-CPU ist nur für den Supervisor zugänglich, während das virtuelle Zählregister CNTVCT_EL0 für den Benutzer zugänglich ist. Darüber hinaus können einige CPUs ihre CPU-Taktfrequenz ändern, um den Stromverbrauch zu senken, aber der interne Prozessortakt wird dadurch nicht beeinflusst, und der Counter-Timer bleibt monoton.


Verwendung des Cycle Counter Registers auf dem Raspberry Pi 4

ARM-Prozessoren bieten Unterstützung für verschiedene Register zur Leistungsüberwachung, von denen das Cycle Counter Register das grundlegendste ist. Es kann auf dem Raspberry Pi 4 mit seinem ARM Cortex-A72-Prozessor verwendet werden.

Der Zugriff auf die Leistungsüberwachungsregister erfolgt über Coprozessorregister und die Befehle "mrc" und "mcr". Welche spezifischen Register verwendet werden, hängt von der verwendeten Architektur ab. (CP15 c9 performance monitors registers)

Standardmäßig ist die Verwendung dieser Befehle nur im "privilegierten" Modus möglich. Der erste Schritt besteht darin, den Zugriff auf die Register vom Userspace aus zu ermöglichen. Dies kann durch ein einfaches Kernelmodul erreicht werden, das auch die notwendigen Parameter für den Cycle Counter setzen kann.

Nach der Installation des Kernelmoduls können die Cycle Counter verwendet werden. (PMCCNTR, Performance Monitors Cycle Count Register, VMSA)

$ #On Rapberry Pi
$ make # build the kernel modul
$ sudo insmod enable_ccr.ko # install the kernel modul image
$ #Now Cycle Count Register Enable

Zunächst fällt bei den GetPid-Tests auf, dass die Zyklenzahl verglichen mit x86 sehr hoch ist.


