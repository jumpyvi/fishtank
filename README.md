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

The qemu + libvirt stack in alpine quadlet, you need a client (ex: the virt-man flatpak)

`just in-virt`

`just setup-virt`

You will need to reboot after the service starts so you get added to the right groups and for you polkit/firewall to reload

## Docker (DiP)

Docker installed in a quadlet, works well for basic workload / devcontainers. Requires the client installed (ex: from brew)

`just in-dip`

`just setup-dip`

Also, you need a sysuser conf a bit like this:
```
g docker 2375 -
m YOUR_USER docker
```


## Systemd-Dockerd

Docker installed from a quadlet to a systemd-mount

`just in-systemddocker`


# Legal / Thanks

- This packages and distribute docker components from docker/flatcar that are under Apache2.0