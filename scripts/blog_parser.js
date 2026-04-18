
// Getting the parameters from the URL
const params = new URLSearchParams(window.location.search);

const raw_id = params.get('id');
const id = Number(raw_id);

async function display_blog() {
    try {
        // Fetches the file from the blog dump
        const response = await fetch(`/src/blogs/${id}.json`);

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        // Parses the response as JSON into a JavaScript object
        const file = await response.json();

        // This is where we will start inserting the HTML elements
        const existing_header = document.getElementById("blog-content");

        // Checks if there is a video link for this blog
        if (file["source"]) {
            // Video player
            existing_header.insertAdjacentHTML("afterbegin", `<iframe id="blog-source" src="${file["source"]}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>`);
        } else {
            // Contents and document link
            existing_header.insertAdjacentHTML("afterbegin", `<iframe id="blog-pdf" src="/src/blogs/${id}.pdf" frameborder="0"></iframe>`);
            existing_header.insertAdjacentHTML("afterbegin", `<div id="outside-pdf"> <a href="/src/blogs/${id}.pdf" target="_blank" rel="noreferrer noopener">Open in separate page</a> </div>`);
        }
        
        // Title and date
        existing_header.insertAdjacentHTML("afterbegin", `<div id="blog-date">${file["date"]}</div>`);
        existing_header.insertAdjacentHTML("afterbegin", `<div id="blog-header">${file["title"]}</div>`);

    } catch (err) {
        console.error("Failed to fetch the file:", err);
    }
}

display_blog();
