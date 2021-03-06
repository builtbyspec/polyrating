from requests import get
from bs4 import BeautifulSoup
import pandas as pd, re

max_evals = 4301
cols = ["Name", "Dept", "Gender", "Num_Evals", "Emp", "Comp"]
all_data = []

for eval_count in range(1, max_evals + 1):
    print("Scraped", eval_count, "/", max_evals, end="\r") #A progress tracker hehe
    url = get("http://polyratings.com/eval.php?profid=" + str(eval_count))
    content = BeautifulSoup(url.text, "html.parser")
    try:
        name = content.select_one(".text-primary > strong").string
        dept = content.select_one(".col-xs-12 > h4:nth-of-type(2)").string[2:]
        ratings = content.select(".col-xs-4.hidden-xs b")
        num_evals = ratings[0].string[:-12]
        empathy = ratings[1].string[-4:]
        competency = ratings[2].string[-4:]
        he = content.find_all(string=re.compile(" he "))
        she = content.find_all(string=re.compile(" she "))
        if len(she) > len(he):
            gender = "Female"
        elif len(he) > len(she):
            gender = "Male"
        else:
            gender = "NA"
    except:
        name = None
        dept = None
        gender = None
        num_evals = None
        empathy = None
        competency = None
    all_data.append([name, dept, gender, num_evals, empathy, competency])
print("Complete! The compathy-data.csv is ready for analysis.")
df = pd.DataFrame(all_data, columns = cols)
df.to_csv("compathy-data.csv") 

