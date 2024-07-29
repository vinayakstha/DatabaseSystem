# importing libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from dateutil import parser

# Read data
data = pd.read_csv("AirlineReviews.csv")

# Display info
print(data.head())
print(data.info())

# Check for null values
print(data.isnull().sum())

# Histogram for Entertainment Rating
plt.figure(figsize=(10, 6))
sns.histplot(data["EntertainmentRating"], kde=True)
plt.xlabel("Entertainment Rating")
plt.ylabel("Count")
plt.title("Distribution of Entertainment Rating")
plt.show()

# Box plot for Food Rating
plt.figure(figsize=(10, 6))
sns.boxplot(data["FoodRating"])
plt.xlabel("Food Rating")
plt.title("Box Plot of Food Rating")
plt.show()


# Handle date columns
def parse_date(date):
    try:
        return parser.parse(date, dayfirst=True)
    except:
        return pd.NaT


data["DateFlown"] = data["DateFlown"].apply(parse_date)
data["DatePub"] = data["DatePub"].apply(parse_date)

print(data[["DateFlown", "DatePub"]].head())

# Line graph for Overall Score over Date Flown
plt.figure(figsize=(10, 6))
sns.lineplot(data=data, x="DateFlown", y="OverallScore")
plt.xlabel("Date Flown")
plt.ylabel("Overall Score")
plt.title("Overall Score Over Time (Date Flown)")
plt.show()

# Bar graph for Overall Score by Cabin Type
plt.figure(figsize=(10, 6))
sns.barplot(data=data, x="CabinType", y="OverallScore")
plt.xlabel("Cabin Type")
plt.ylabel("Overall Score")
plt.title("Overall Score by Cabin Type")
plt.show()

# Pie chart for Distribution of Reviews by Cabin Type
cabin_counts = data["CabinType"].value_counts()
plt.figure(figsize=(8, 8))
plt.pie(cabin_counts, labels=cabin_counts.index, autopct="%1.1f%%", startangle=140)
plt.title("Distribution of Reviews by Cabin Type")
plt.show()
