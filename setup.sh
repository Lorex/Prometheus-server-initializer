#/bin/sh

clear

function pause(){
    read -n 1 -p "$*" INP
    echo -ne '\b \n'
}

echo "=============================="
echo "|       普 羅 米 修 斯       |"
echo "|     伺服器前置設定程式     |"
echo "=============================="
echo "|   v1.0.150917 工程組專用   |"
echo "=============================="
echo
pause '按任意鍵開始安裝...'

echo [1/6] 安裝 EPEL 中...
cd /tmp
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -O epel-release-latest-7.noarch.rpm 2>> err.txt
sudo rpm -i epel-release-latest-7.noarch.rpm 1>/dev/null 2>> err.txt

echo [2/6] 更新套件清單中...
sudo yum update -y 1>/dev/null 2>> err.txt
echo [3/6] 更新套件中...
sudo yum upgrade -y 1>/dev/null 2>> err.txt

echo [4/6] 正在安裝 g++...
sudo yum install -y gcc gcc -c++ 1>/dev/null 2>> err.txt

echo [5/6] 正在安裝 zsh...
sudo yum install -y zsh git git-core 1>/dev/null 2>> err.txt
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O install.sh 1>/dev/null 2>> err.txt
sh install.sh 1>/dev/null 2>> err.txt

echo [6/6] 正在切換到 zsh
chsh -s /bin/zsh 2>> err.txt

if [[ -f err.txt ]]; then
	echo "設定過程中發生錯誤："
	cat err.txt
fi

echo 設定完成！