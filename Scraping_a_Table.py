
from bs4 import BeautifulSoup
import pandas as pd
import requests

url = "https://en.wikipedia.org/wiki/List_of_largest_companies_by_revenue"
page = requests.get(url)
soup = BeautifulSoup(page.text, "html.parser")
table = soup.find_all("table")[0]
rows = table.find_all("tr")
table_header = table.find_all("th")[0:7]
clean_table_header = [header.text.strip() for header in table_header]
df = pd.DataFrame(columns= clean_table_header)


for row in rows[1:]:
    columns = row.find_all("td")
    if len(columns)>= 7:
           row_data = [data.text.strip() for data in columns[:7]]
           length = len(df)
           df.loc[length] = row_data

    
df.to_csv("Top_companies.csv", index=False, encoding= 'utf-8')

df.info()
print(clean_table_header)

table_header
clean_table_header