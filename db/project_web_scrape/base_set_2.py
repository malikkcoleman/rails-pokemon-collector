# Web Scrape for TCG Collector to collect data

from bs4 import BeautifulSoup
import requests
import csv
import html5lib

def create_csv_file():
    with open('BaseSet2Unlimited.csv', 'w', newline='',
              encoding='utf-8') as f:
        the_writer = csv.writer(f, quoting=csv.QUOTE_NONE)
        the_writer.writerow(
            ['set_id', 'name', 'card_number', 'type', 'rarity', 'edition', 'price',  'image'
             ])


def append_to_csv_file(set_id, name, card_number, type, rarity, edition, price, image):
    """

    """
    with open('BaseSet2Unlimited.csv', 'a', newline='',
              encoding='utf-8') as f:
        the_writer = csv.writer(f)
        the_writer.writerow([set_id, name, card_number, type, rarity, edition, price, image])


# Stores all the image urls of the pokemon from Base Set first edition
image_urls = []

image_urls_index = 0

html_text = requests.get(
    'https://www.tcgcollector.com/cards/intl/base-set-2?cardSource=all&sortBy=cardNumber&releaseDateOrder=newToOld&cardsPerPage=30&displayAs=list').text

html_text_tcg = open('/Users/colemancapsule/Documents/RRCWEBD3008/pokemon_collector/db/project_web_scrape/base_set_2_images.html', 'r')

soup_tcg = BeautifulSoup(html_text_tcg, 'html5lib')
soup = BeautifulSoup(html_text, 'lxml')
pokemon = soup.find_all(
    'div', class_='card-list-item card-search-result-card')

images = soup_tcg.find_all('div', class_='card-search-result-card')

for image in images:
    image_tag = image.find('img')
    image_alt = image_tag.get('alt')
    image_src = image_tag.get('src')
    image_urls.append(image_src)

# Creates our CSV file and defines Column names
create_csv_file()
edition = '1st Edition'
for poke in pokemon:
    # HTML div wrapping the Pokemon's name
    name = poke.find('div', class_='card-list-item-card-name')

    name_text = name.find(
        'a', class_='card-list-item-entry-text').text


    # HTML div wrapping the set number of the card
    set_number = poke.find('div', class_='card-list-item-card-number')
    # The text value of the card's set number pulled from HTML div stored in set_number_div
    set_number_text = set_number.find(
        'span', class_='card-list-item-entry-text').text.replace(' ', '')

    try:
        #HTML div wrapping rarity
        rarity = poke.find('div', class_='card-list-item-rarity')
        rarity_text = rarity.find('span', class_='card-list-item-entry-text').text
    except:
        #HTML div wrapping rarity
        rarity = poke.find('div', class_='card-list-item-rarity')
        rarity_text = rarity.find('img').get('title')

    try:
        # HTML div wrapping the rarity containing the holo type
        type = poke.find('div', class_='card-list-item-type')
        type_text = type.find('img').get('title')
    except:
         # HTML div wrapping the rarity containing the holo type
        type = poke.find('div', class_='card-list-item-type')
        type_text = type.find('span', class_='card-list-item-entry-text').text

    try:
        price = poke.find('div', class_='card-list-item-price')
        price_text = price.find('button').text
    except:
        price_text = 'N/A'


    # look to add image reference to pull small and large images of card with variation type for said row have your
    # method be called here and a request to scrape that image url from another page then added to the card row

    # print(variation_id)
    # print(variation_category)
    # print(variation_name)
    # print(name_text)
    print(set_number_text)
    # print(expansion_text)

    append_to_csv_file('4', name_text.strip(), set_number_text.strip(),type_text.strip(), rarity_text.strip(), edition, price_text.replace('$', '').strip(), image_urls[image_urls_index])

    image_urls_index = image_urls_index + 1

