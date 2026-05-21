import json
import sys

if __name__ == "__main__":
    # Define the filenames
    output_file = f"{sys.argv[1]}/index.html"

    try:
        # 1. Read the contents into string variables
        with open("./src/stubs/header.html", 'r') as f1:
            header = f1.read()
        
        with open(f"{sys.argv[1]}/body.html", 'r') as f2:
            body = f2.read()
            
        with open("./src/stubs/closing.html", 'r') as f3:
            closing = f3.read()

        with open(f"{sys.argv[1]}/meta.json", 'r') as f4:
            meta = json.loads(f4.read())

        header = header.replace("LANG_GOES_HERE", meta["lang"])
        header = header.replace("TITLE_GOES_HERE", meta["title"])
        header = header.replace("AUTHOR_GOES_HERE", ", ".join(meta["author"]))
        header = header.replace("DATE_GOES_HERE", meta["date"])
        header = header.replace("KEYWORDS_GO_HERE", ", ".join(meta["keywords"]))

        # 2. Write the strings one after the other to the output file
        with open(output_file, 'w') as out:
            out.write(header)
            out.write(body)
            out.write(closing)
            
    except FileNotFoundError as e:
        print(f"Error: One of the input files was not found. {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

