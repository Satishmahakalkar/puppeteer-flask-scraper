 Puppeteer + Flask Scraper

This project demonstrates using Node.js with Puppeteer to scrape content from a given website and serve the scraped data using a lightweight Python Flask server — all containerized via a multi-stage Docker build.

---

 Features
![py2](https://github.com/user-attachments/assets/54fa61de-45a4-493d-b01b-21647fbcd058)
![py1](https://github.com/user-attachments/assets/47c5e792-b301-42bc-bbee-abeccb38a9e3)

- Uses Puppeteer (Node.js) to perform headless browser scraping.
- Scrapes dynamic websites by visiting the given URL and extracting basic data like title and heading.
- Serves the scraped content as JSON via a Flask API.
- Clean multi-stage Dockerfile for efficient build and minimal image size.

---

 Tech Stack

- Node.js + Puppeteer (Scraping)
- Python + Flask (Web server)
- Docker (Multi-stage build)



 How to Build & Run

 1. Clone the Repository

bash
git clone https://github.com/Satishmahakalkar/puppeteer-flask-scraper.git
cd puppeteer-flask-scraper
2. Build the Docker Image
bash
Copy
Edit
docker build -t puppeteer-flask-scraper.
3. Run the Container with a URL to Scrape
You need to provide the URL to scrape using the environment variable SCRAPE_URL.

bash
Copy
Edit
docker run -e SCRAPE_URL="https://example.com" -p 5000:5000 puppeteer-flask-scraper
📄 Example Output
Once the container is running, visit:

arduino
Copy
Edit
http://localhost:5000/  or 
http://public IP:5000/

You’ll see the scraped output like:

json
Copy
Edit
{
  "title": "Example Domain",
  "heading": "Example Domain"
}
