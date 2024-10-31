#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


df1= pd.read_excel('Resources/crowdfunding.xlsx')
df2= pd.read_csv('category.csv')
df3= pd.read_csv('subcategory.csv')


# In[3]:


crowdfunding_df = df1[['cf_id', 'contact_id', 'company_name', 'blurb', 
                  'goal', 'pledged', 'outcome', 'backers_count', 
                  'country', 'currency', 'launched_at', 'deadline', 'category & sub-category']]
crowdfunding_df[['category','sub-category']]=crowdfunding_df['category & sub-category'].str.split('/', n=1, expand=True)
crowdfunding_df=crowdfunding_df.drop(columns=['category & sub-category'])
crowdfunding_df.head()


# In[4]:


category_df = df2[['category_id', 'category_name']]
category_df.rename(columns={'category_name': 'category'}, inplace=True)
category_df


# In[5]:


subcategory_df = df3[['subcategory_id', 'subcategory_name']]
subcategory_df.rename(columns={'subcategory_name': 'sub-category'}, inplace=True)
subcategory_df


# In[6]:


campaign_df=crowdfunding_df.merge(category_df, on="category", how='left').merge(subcategory_df, on="sub-category", how='left')
campaign_df=campaign_df.drop(columns=['category','sub-category'])
campaign_df


# In[8]:


campaign_df.rename(columns={'blurb': 'description', 
                            'launched_at': 'launch_date', 
                            'deadline': 'end_date'}, inplace=True)
# Convert data types
campaign_df['goal'] = campaign_df['goal'].astype(float)
campaign_df['pledged'] = campaign_df['pledged'].astype(float)
campaign_df['launch_date'] = pd.to_datetime(campaign_df['launch_date'], unit='s')
campaign_df['end_date'] = pd.to_datetime(campaign_df['end_date'], unit='s')

campaign_df.to_csv('campaign.csv', index=False)

campaign_df.head()


# In[ ]:




