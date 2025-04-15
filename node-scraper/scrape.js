const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch({
    headless: 'new',  // Avoid headless warning
    executablePath: '/usr/bin/chromium',  // Yeh important hai!
    args: ['--no-sandbox', '--disable-setuid-sandbox']
  });

  const page = await browser.newPage();
  const url = process.env.SCRAPE_URL || 'https://example.com';

  await page.goto(url);

  const data = await page.evaluate(() => {
    return {
      title: document.title,
      heading: document.querySelector('h1')?.innerText || 'No H1 found'
    };
  });

  const fs = require('fs');
  fs.writeFileSync('scraped_data.json', JSON.stringify(data, null, 2));

  await browser.close();
})();

