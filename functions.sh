#Colors
#man ascii => Ver los caracteres ascii
#\e => cacracter escape
#\033 => cracter escape
#[0;31 => 0 -> establece tipo de fuente, predeterminado ninguno y 31 -> establece el color 31 = rojo
#[1m => Establece estilo de fuente en negrita, 0 por defecto
redclr='\e[0;31m\033[1m'
greenclr='\e[0;32m\033[1m'
yellowclr='\e[0;33m\033[1m'
purpelclr='\e[0;35m\033[1m'
turquoiseclr='\e[0;36m\033[1m'
endclr='\033[0m\e[0m'

#Functions 
function extractPorts(){
        ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
        tports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | wc -l)"
        ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
        echo -e "\n[*] IP Adrress: ${greenclr}$ip_address${endclr}\n" > extractPorts.tmp
        echo -e "\t[*] Open ports: ${redclr}$ports${endclr}\n"  >> extractPorts.tmp
        echo -e "\t[*] Total ports: ${greenclr}$tports${endclr}\n"  >> extractPorts.tmp
        echo "nmap -sCV -p$ports $ip_address -oN target" | tr -d '\n' | xclip -sel clip
        echo -e "[+] Nmap Command copied to clipboard\n"  >> extractPorts.tmp
        cat extractPorts.tmp; rm extractPorts.tmp
}

function mkt(){
  mkdir {enum,content,exploits}
}

function delhistory(){
  echo '' > /root/.zsh_history
  echo '' > /home/user/.zsh_history #Change user
}
