#!/bin/bash

# Homebrew'un kurulu olup olmadığını kontrol et
if ! command -v brew &> /dev/null
then
    echo "Homebrew bulunamadı. Homebrew'u kurmak ister misiniz? (evet/hayır)"
    read answer

    if [ "$answer" != "${answer#[Ee]}" ] ;then
        # Homebrew kurulum komutu
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew kurulumu reddedildi, script sonlandırılıyor."
        exit 1
    fi
fi

# Homebrew ile paketleri kontrol et, güncelle veya yükle
declare -a packages=("llvm" "gcc@11" "ripgrep" "imagemagick" "ffmpegthumbnailer" "chafa" "viu" "gnu-sed" "go" "trash" "fzf" "composer")
for package in "${packages[@]}"
do
    if brew list --formula | grep -q "^$package\$"; then
        echo "$package zaten yüklü. Güncellemeler kontrol ediliyor..."
        brew upgrade "$package"
    else
        echo "$package yükleniyor..."
        brew install "$package"
    fi
done

echo "sanal dosyalar oluşturuluyor..."

sudo ln -f /opt/homebrew/opt/llvm/bin/lldb-vscode /opt/homebrew/opt/llvm/bin/lldb-dap
sudo ln -f /opt/homebrew/opt/llvm/bin/lldb-server /opt/homebrew/opt/llvm/bin/lldb-dap-server

echo "İşlemler tamamlandı."
