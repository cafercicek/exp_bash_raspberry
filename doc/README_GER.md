Es gibt zwei Arten von Zeitinformationen in den heutigen Computern. Die eine ist der Hardware-Timestamp und die andere ist die Systemuhr, die die globale Uhr anzeigt. Systemuhr: Die Systemuhr ist die globale Uhr, die für Zertifikatsprüfung und Protokollierung verwendet wird. Im Allgemeinen basiert die Quelle der Systemuhr auf einem externen Peripheriegerät namens "Real Time Clock" (RTC) zum Zeitpunkt des Systemstarts. Die RTC wird durch eine Batterie mit Strom versorgt und ist auch bei ausgeschalteter CPU in Betrieb.

Der Hardware-Timestamp zählt die Anzahl der internen Prozessortaktzyklen. Der Timestamp-Zähler ist eine spezielle Hardware-Ressource in einer CPU, auf die mit speziellen Befehlen zugegriffen werden kann. 



Das physische Zählregister CNTPCT_EL0 des Zähler-Timers der ARM-CPU ist nur für den Supervisor zugänglich, während das virtuelle Zählregister CNTVCT_EL0 für den Benutzer zugänglich ist. Darüber hinaus können einige CPUs ihre CPU-Taktfrequenz ändern, um den Stromverbrauch zu senken, aber der interne Prozessortakt wird dadurch nicht beeinflusst, und der Counter-Timer bleibt monoton.
