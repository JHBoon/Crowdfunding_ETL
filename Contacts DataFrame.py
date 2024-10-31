#!/usr/bin/env python
# coding: utf-8

# In[9]:


import pandas as pd


# In[19]:


contacts_df= pd.read_excel('Resources/contacts.xlsx', header=3)
print(contacts_df)


# In[20]:


import json
dict_values=[]
for i, row in contacts_df.iterrows():

    data = row['contact_info']

    converted_data = json.loads(data)

 

    # Append the converted row to a list.

    dict_values.append(converted_data)

 

# Print out the list of dictionaries

print(dict_values)


# In[22]:


contacts_df=pd.DataFrame(dict_values)
contacts_df.head()


# In[33]:


contacts_df[['first_name','last_name']]=contacts_df['name'].str.split(' ', n=1, expand=True)
contacts_df_clean=contacts_df.drop(columns=['name'])
contacts_df_clean = contacts_df[['contact_id', 'first_name','last_name', 'email']]
contacts_df_clean


# In[35]:


contacts_df_clean.to_csv('contacts.csv', index=False)


# In[ ]:




