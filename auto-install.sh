#!/bin/bash

# Kiểm tra xem có quyền root không
if [[ $EUID -ne 0 ]]; then
   echo "Script phai chay voi quyen root." 
   exit 1
fi

read -p "Ban co muon cai dat Nginx (y/n)? " install_nginx

# Cài đặt Zsh
echo "Cai dat Zsh..."
apt-get update
apt-get install -y zsh

# Cài đặt Oh My Zsh
echo "Cai dat Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Thay đổi theme của Oh My Zsh thành "candy"
echo "Thay doi theme cua Oh My Zsh thanh 'candy'..."
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="candy"/' ~/.zshrc

# Cài đặt plugin Zsh-autosuggestions
echo "Cai dat plugin Zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i 's/plugins=(/plugins=(zsh-autosuggestions /' ~/.zshrc

# Cài đặt plugin Zsh-syntax-highlighting
echo "Cai dat plugin Zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(zsh-autosuggestions /plugins=(zsh-autosuggestions zsh-syntax-highlighting /' ~/.zshrc

# Thêm alias "ungz" và "unbz"
echo 'alias ungz="tar -zxvf"' >> ~/.zshrc
echo 'alias unbz="tar -jxvf"' >> ~/.zshrc

# Kích hoạt Zsh
echo "Kich hoat Zsh..."
chsh -s /bin/zsh

# Cài đặt Nginx nếu người dùng chọn "yes"
if [[ $install_nginx == "y" ]]; then
    echo "Cai dat Nginx Mainline..."
    apt-get install -y curl gnupg2 ca-certificates lsb-release
    echo "deb http://nginx.org/packages/mainline/$(lsb_release -cs) nginx" > /etc/apt/sources.list.d/nginx.list
    curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
    apt-get update
    apt-get install -y nginx
fi

echo "Hoan thanh. Vui long dang nhap lai hoac khoi dong lai he thong de ap dung thay doi."
