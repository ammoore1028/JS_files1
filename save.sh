output_file="/root/tools/js_files/JS_files.txt"

number_files=$(ls -la  /root/tools/js_files/formatted_output_* | wc -l)
# Clear the output file if it already exists
> "$output_file"

# Loop from 1 to number_files
for ((i=1; i<=number_files; i++)); do
    # Append the filename to the output file
    echo "formatted_output_$i.js" >> "$output_file"
done
