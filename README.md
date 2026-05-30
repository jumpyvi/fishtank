# Fish Tank

> The artist formally known as Bluefin's dx-next

![alt text](media/u1f41f_u1f52e.png)


# Quick setup

This is incompatible with SELinux

Made for

- ubuntu / debian
- zirconium:hawaii
- bluefin:dakota
- gnomeOS


## Virtualization (Libvirt + MultiArch Qemu)

`just in-virt`

`just setup-virt`

Also, you need a sysuser conf a bit like this:
```
g libvirt 5679 -
m YOUR_USER libvirt
u dnsmasq - "dnsmasq" /var/lib/dnsmasq /sbin/nologin
```


## Docker (DiP)

`just in-dip`

`just setup-dip`

Also, you need a sysuser conf a bit like this:
```
g docker 2375 -
m YOUR_USER docker
```


# Legal / Thanks

This code is provided with no restrictions or warranties under the "Unlicense".

This packages and distributes libvirt components that are under GPLv2