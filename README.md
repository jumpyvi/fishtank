# Fish Tank

> The artist formally known as Bluefin's dx-next

![alt text](media/u1f41f_u1f52e.png)


# What is this?

This uses systemd-based utils to install software of read-only root Linux.

Goals: </br>
    - Auto-update everything </br>
    - As few UX changes as possible once installed </br>
    - Compatible with every non-selinux, systemd-based GLIBC distros </br>

Non-goals: </br>
    - Install scripts that makes sense </br>
    - SELinux/Fedora support


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

You will need to reboot after the service starts so you get added to the right groups and for your polkit/firewall to reload

## Docker (DiP)

Docker installed in a quadlet, works well for basic workload / devcontainers. Requires the client installed (ex: from brew)

/home is accessible as usuall, /etc and /var are accessible by mounting /host/etc or /host/var in your volume mount.

While this seems to work without issues, this is still nested containerization, if you want something more normal, check out systemd-dockerd

`just in-dip`

`just setup-dip`

Also, you need a sysuser conf a like this:
```
g docker 2375 -
m YOUR_USER docker
```


## Systemd-Dockerd

Docker installed from a quadlet to a sysext

Docker is NOT containerized with that install method, it's as close as good old "shove and run packaging" as it gets

`just in-systemddocker`

Why the fuck?
- Distributable via OCI (unlike normal sysexts)
- Docker is at /usr/bin/docker (expected by vscode)
- No downside / crazy deps (like brew)


## Flatcar components installer

Download sysext directly from flatcar!

- Docker
- Tailscale
- k3s
- rke2

`just -f flatcar-install.just --choose`

# Legal / Thanks

- This packages and distribute modified docker components from docker/flatcar that are licensed under Apache 2.0
- This uses workflows modified from [ublue-os/boxkit](https://github.com/ublue-os/boxkit/blob/main/.github/workflows/build-boxkit.yml) licensed under Apache 2.0