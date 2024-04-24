import requests
import jsbeautifier
import sys

def format_js_from_url(url, output_file):
    try:
        response = requests.get(url)
        data = response.text
        opts = jsbeautifier.default_options()
        opts.indent_size = 2
        formatted_data = jsbeautifier.beautify(data, opts)
        with open(output_file, 'w') as file:
            file.write(formatted_data)
        print(f"Formatted file saved as {output_file}")
    except requests.exceptions.RequestException as e:
        print(f"Error fetching {url}: {e}")

with open(sys.argv[1], 'r') as file:
    urls = file.readlines()

for i, url in enumerate(urls):
    url = url.strip()
    if url:
        output_file = f"formatted_output_{i}.js"
        format_js_from_url(url, output_file)
