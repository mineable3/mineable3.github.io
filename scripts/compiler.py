from datetime import datetime
import json
import sys

if __name__ == "__main__":
    # Define the filenames
    output_file = f"{sys.argv[1]}/index.html"

    try:
        # Read the contents into string variables
        with open("./src/stubs/header.html", 'r') as f1:
            header = f1.read()
        
        with open(f"{sys.argv[1]}/body.html", 'r') as f2:
            body = f2.read()
            
        with open("./src/stubs/closing.html", 'r') as f3:
            closing = f3.read()

        with open(f"{sys.argv[1]}/meta.json", 'r') as f4:
            meta = json.loads(f4.read())
            meta["date"] = datetime.strptime(meta["date"], "%b %d, %Y")

        header = header.replace("LANG_GOES_HERE", meta["lang"])
        header = header.replace("TITLE_GOES_HERE", meta["title"])
        header = header.replace("AUTHOR_GOES_HERE", ", ".join(meta["author"]))
        header = header.replace("DATE_GOES_HERE", meta["date"].strftime("%b %d, %Y"))
        header = header.replace("KEYWORDS_GO_HERE", ", ".join(meta["keywords"]))

        # Writing the output to the index.html file
        with open(output_file, 'w') as out:
            out.write(header)
            out.write(body)
            out.write(closing)
 
        # Adding this blog to the blog list
        with open("./src/blog_list.html", 'r+') as blog_list:
            content = blog_list.read()
            lines = content.splitlines()
            blog_link_html = f'                <li class="blog-item"><a href="/{output_file}" rel="noreferrer noopener" class="blog-link">{meta["title"]}</a> <div class="blog-date">({meta["date"].strftime("%m-%d-%y")})</div></li>'

            # Edits an existing link
            if output_file in content:
                for i in range(len(lines)):
                    # searches for file name because the blog title may change
                    # if the title stays the same then the file will be unchanged
                    if output_file in lines[i]:
                        lines.pop(i) 
                        lines.insert(i, blog_link_html)
                        break
            # Creates a new link
            else:
                # finds the place to insert links and inserts the link
                for i in range(len(lines)):
                    if "<!-- BLOG_LINKS_GO_HERE -->" in lines[i]:
                        lines.insert(i+1, blog_link_html)
                        break

            # Overwrites the current file
            blog_list.seek(0) # moves file pointer to the start of the file
            blog_list.write('\n'.join(lines)) # writes the new data
            blog_list.truncate() # deletes anything after the file pointer
            
    except FileNotFoundError as e:
        print(f"Error: One of the input files was not found. {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

