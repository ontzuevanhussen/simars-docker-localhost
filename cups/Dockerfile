FROM anujdatar/cups

RUN apt-get update && apt-get upgrade -y

RUN apt-get install cups -y
RUN apt-get install cups-bsd -y
RUN apt-get install smbclient -y
RUN apt-get install python3-smbc -y
RUN apt-get install samba samba-common-bin -y

# Copy config cups SIMARS
COPY cupsd.conf /etc/cups/
COPY printers.conf /etc/cups/
COPY smb.conf /etc/samba/

# Ports Used for SMB Printer Sharing
EXPOSE 137/udp
EXPOSE 139/tcp
EXPOSE 445/tcp
EXPOSE 631/tcp

RUN apt-get install nano sudo
