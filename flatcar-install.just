install-from-flatcar name:
    sudo mkdir -p /etc/extensions/
    sudo mkdir -p /opt/extensions/
    sudo mkdir -p /etc/sysupdate.{{name}}.d/
    curl -sSL "https://github.com/flatcar/sysext-bakery/releases/download/{{name}}/{{name}}.conf" \
        | sudo tee /etc/sysupdate.{{name}}.d/{{name}}.conf > /dev/null
    sudo /usr/lib/systemd/systemd-sysupdate -C {{name}} update
    sudo systemd-sysext refresh


docker: (install-from-flatcar "docker")

k3s: (install-from-flatcar "k3s")

rke2: (install-from-flatcar "rke2")

tailscale: (install-from-flatcar "tailscale")
    sudo bash -c 'echo -e "FLAGS=\nPORT=41641" > /etc/default/tailscaled'
