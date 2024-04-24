
# Geeting all JavaScript files
echo -e "\033[34m[+] Running Analysis JS [+]\033[0m"
mkdir -p /root/tools/js_files/
cd  /root/tools/js_files/

# please write the domain in the script
python3 /root/tools/js_files/URLs.py $1
wait
# please write the domain in the script
bash /root/tools/js_files/save2.sh
wait
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
wait
for i in $(cat /root/tools/js_files/JS_files.txt); do python3 /root/tools/js_files/LinkFinder/linkfinder.py -i "$i" -o cli >> /root/tools/js_files/wordlist.txt ;done

cat  /usr/share/seclists/Discovery/Web-Content/common.txt  /root/tools/js_files/wordlist.txt > /root/tools/js_files/wordlists_temp.txt

cat /root/tools/js_files/wordlists_temp.txt | sort -u | uniq > /root/tools/js_files/wordlists.txt

# End of the scripts

echo -e "\033[34m[+] I save the wordlist in this path /root/tools/js_files/wordlists.txt and added with /usr/share/seclists/Discovery/Web-Content/common.txt list [+]\033[0m"
