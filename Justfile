in-virt:
    sudo podman build -f oci/qemu.oci -t localhost/qemu:3 --network host
    sudo cp src/quadlets/fishtank-virt.container /etc/containers/systemd/
    sudo systemctl daemon-reload
    sudo systemctl restart fishtank-virt

in-dip:
    sudo cp src/quadlets/fishtank-dip.container /etc/containers/systemd/
    sudo systemctl daemon-reload
    sudo systemctl restart fishtank-dip

setup-virt:
    flatpak override --user --filesystem=/var/lib/fishtank/ org.virt_manager.virt-manager
    flatpak run org.virt_manager.virt-manager -c "qemu:///system?socket=/var/lib/fishtank/libvirtd/libvirt-sock" --show-host-summary

setup-dip:
    brew install docker docker-compose
    /home/linuxbrew/.linuxbrew/bin/docker context create dip --docker "host=unix:///var/lib/fishtank/dockerd/docker.sock"
    /home/linuxbrew/.linuxbrew/bin/docker switch dip