
import pandas as pd

# Dataset load karo
df1 = pd.read_csv('customer_churn_dataset-testing-master.csv')
df2 = pd.read_csv('customer_churn_dataset-training-master.csv')

# combine both dataset
combined = pd.concat([df1, df2], ignore_index=True)

# Remove CustomerID  duplicates
combined = combined.drop_duplicates(subset=['CustomerID'])

# Remove missing rows
combined = combined.dropna()

# All integer columns Should be proper integer
int_columns = ['CustomerID', 'Age', 'Tenure', 'Usage Frequency', 
               'Support Calls', 'Payment Delay', 'Last Interaction', 'Churn']

for col in int_columns:
    combined[col] = combined[col].astype(int)

# Final clean data save
combined.to_csv('customer_churn_clean.csv', index=False)





import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

# load cleaned data
df=pd.read_csv('customer_churn_clean.csv')
print(df)

# churn Rate
churn_rate=df["Churn"].mean()*100
print(f"Churn Rate: {churn_rate:.2f}%")

# churn by gender
sns.countplot(data=df,x="Gender",hue="Churn")
plt.title("Churn by Gender")
plt.show()

# churn  by subscription type
sns.countplot(data=df,x="Subscription Type",hue="Churn")
plt.title("Churn by Contract Length")
plt.show()

# Churn vs Tenure
sns.boxplot(data=df,x="Churn",y="Tenure")
plt.title("Tenure distribution by Chrun")
plt.show()

# Spend vs churn
sns.boxplot(x="Churn",y="Tenure",data=df)
plt.title("Total Spend Distribution by Churn")
plt.show()