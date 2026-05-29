in:
    sudo podman build -f oci/qemu.oci -t localhost/qemu:3 --network host
    sudo cp src/quadlets/fishtank-virt.container /etc/containers/systemd/
    sudo systemctl daemon-reload
    sudo systemctl restart fishtank-virt

setup:
    flatpak override --user --filesystem=/var/lib/fishtank/ org.virt_manager.virt-manager
    flatpak run org.virt_manager.virt-manager -c "qemu+unix:///system?socket=/var/lib/fishtank/libvirtd/libvirt-sock" --show-host-summary