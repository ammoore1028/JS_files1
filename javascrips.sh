echo -e "\033[34m[+] Running Analysis JS [+]\033[0m"
ammar=$(pwd)  # Storing the current directory path

# Creating a directory if it doesn't exist
new_dir="${ammar}/Analysis"
mkdir -p "$new_dir"
cd "$new_dir"

# Assuming $1 is the domain, ensure it's passed to the script
python3 "${new_dir}/URLs.py" "$1"

# Running additional scripts
bash "${new_dir}/save2.sh"

# Clone LinkFinder if it doesn't exist
if [ ! -d "LinkFinder" ]; then
    git clone https://github.com/GerbenJavado/LinkFinder.git
    cd LinkFinder
else
    cd LinkFinder
    git pull
fi

# Analyze JavaScript files
for i in $(cat "${new_dir}/JS_files.txt"); do 
    python3 linkfinder.py -i "$i" -o cli >> "${new_dir}/wordlist.txt"
done

# Combine and deduplicate wordlists
cat /usr/share/seclists/Discovery/Web-Content/common.txt "${new_dir}/wordlist.txt" | sort -u > "${new_dir}/wordlists.txt"

# End of the scripts
echo -e "\033[34m[+] I saved the wordlist in this path /root/tools/js_files/wordlists.txt and added with /usr/share/seclists/Discovery/Web-Content/common.txt list [+]\033[0m"
