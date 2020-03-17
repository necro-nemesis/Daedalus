UPDATE_URL="https://raw.githubusercontent.com/necro-nemesis/SNApp-Pi-Host/master/"
wget -q ${UPDATE_URL}/installers/common.sh -O /tmp/pihostcommon.sh
source /tmp/pihostcommon.sh && rm -f /tmp/pihostcommon.sh

function update_system_packages() {
    install_log "Updating sources"
    sudo apt-get update || install_error "Unable to update package list"
}

function install_dependencies() {
    install_log "Installing required packages"
    sudo apt-get -y install curl
    echo "Install public key used to sign the lokinet binaries."
    curl -s https://deb.imaginary.stream/public.gpg | sudo apt-key add -
    echo "deb https://deb.imaginary.stream $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/imaginary.stream.list
    sudo apt-get update
    sudo yes | apt-get install git screen dnsutils python3 resolvconf lokinet || install_error "Unable to install dependencies"
}

install_pihost
