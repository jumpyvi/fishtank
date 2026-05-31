in-virt:
    sudo mkdir -p /etc/containers/systemd/
    sudo cp src/quadlets/fishtank-virt.container /etc/containers/systemd/
    sudo systemctl daemon-reload
    sudo systemctl restart fishtank-virt

in-dip:
    sudo mkdir -p /etc/containers/systemd/
    sudo cp src/quadlets/fishtank-dip.container /etc/containers/systemd/
    sudo systemctl daemon-reload
    sudo systemctl restart fishtank-dip

in-systemddocker:
    sudo cp src/quadlets/systemd-docker.container /etc/containers/systemd/
    sudo systemctl daemon-reload
    sudo systemctl restart systemd-docker
    sudo containerd config default | sudo tee /etc/containerd/config.toml
    sudo systemctl restart containerd.service
    sudo systemctl restart docker.service

[script]
setup-virt:
    existing=$(getent group libvirt | cut -d: -f3)
    if [ -n "$existing" ] && [ "$existing" != "5679" ]; then
        echo "ERROR: libvirt group exists with GID $existing (expected 5679)" >&2
        exit 1
    fi
    printf "g libvirt 5679 -\nm %s libvirt\nu dnsmasq - \"dnsmasq\" /var/lib/dnsmasq /sbin/nologin\n" "$USER" | sudo tee /etc/sysusers.d/libvirt.conf
    sudo systemd-sysusers
    sudo mkdir -p /etc/firewalld/zones /etc/polkit-1/actions
    flatpak override --user --filesystem=/var/lib/fishtank/ org.virt_manager.virt-manager
    flatpak run org.virt_manager.virt-manager -c "qemu:///system?socket=/var/lib/fishtank/libvirtd/libvirt-sock" --show-host-summary

[script]
setup-dip:
    brew install docker docker-compose
    /home/linuxbrew/.linuxbrew/bin/docker context create dip --docker "host=unix:///var/lib/fishtank/dockerd/docker.sock"
    /home/linuxbrew/.linuxbrew/bin/docker switch dip