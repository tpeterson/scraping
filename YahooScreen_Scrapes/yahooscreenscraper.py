import scraperwiki
import requests
import lxml.html

html = requests.get("https://screen.yahoo.com").content
dom = lxml.html.fromstring(html)

for entry in dom.cssselect('.view-count-item'):
    post = {
        'title': entry.cssselect('.title')[0].text_content(),
        'views': entry.cssselect('.view-count')[0].text_content(),
        'url': entry.cssselect('a')[0].get('href'),
    }
    print post