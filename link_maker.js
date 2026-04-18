async function make_link(header, id, is_video) {

    try {
        // Fetches 'data.txt' from the same folder where the HTML/JS is hosted
        const response = await fetch(`./blog_dump/${id}.html`);

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const text = await response.text();
        const lines = text.split(/\r?\n/);

        const title = lines[0];

        // This is where we will start inserting the HTML elements
        const existing_header = document.getElementById(header);
        existing_header.insertAdjacentHTML("afterbegin", `<li class="blog-item"><a href="blog_post.html?id=${id}&is_video=${is_video}" rel="noreferrer noopener" class="blog-link">${title}</a></li>`);

    } catch (err) {
        console.error("Failed to fetch the file:", err);
    }
}

export { make_link };

