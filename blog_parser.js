
// Getting the parameters from the URL
const params = new URLSearchParams(window.location.search);

const raw_id = params.get('id');
const raw_is_video = params.get('is_video');

const id = Number(raw_id);
const is_video = Number(raw_is_video); // 0 is Falsy and 1 is Truthy

async function display_blog() {
    try {
        // Fetches 'data.txt' from the same folder where the HTML/JS is hosted
        const response = await fetch(`./blog_dump/${id}.html`);

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const text = await response.text();
        const lines = text.split(/\r?\n/);

        // This is where we will start inserting the HTML elements
        const existing_header = document.getElementById("blog-content");

        if (is_video) {
            // Video player
            existing_header.insertAdjacentHTML("afterbegin", `<iframe id="blog-source" src="${lines[2]}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>`);
        } else {
            // Contents and document link
            existing_header.insertAdjacentHTML("afterbegin", `<iframe id="blog-pdf" src="blog_dump/${id}.pdf" frameborder="0"></iframe>`);
            existing_header.insertAdjacentHTML("afterbegin", `<div id="outside-pdf"> <a href="${id}.pdf" target="_blank" rel="noreferrer noopener">Open in separate page</a> </div>`);
        }
        
        // Title and date
        existing_header.insertAdjacentHTML("afterbegin", `<div id="blog-date">${lines[1]}</div>`);
        existing_header.insertAdjacentHTML("afterbegin", `<div id="blog-header">${lines[0]}</div>`);

    } catch (err) {
        console.error("Failed to fetch the file:", err);
    }
}

display_blog();
