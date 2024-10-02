# -*- coding: utf-8 -*-
"""turma-banco.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1aRKbGz5Cd9riKoIlxmPVDraLfTH73fuX
"""

print("Olá, mundo!")

nome = input("Qual é o seu nome?")
print("Olá,"+ nome + "!")

import numpy as np
import pandas as pd # Varredura, ler elemento em tabelass
import matplotlib.pyplot as plt
import seaborn as sns
import warnings

warnings.filterwarnings("ignore")

#

!wget https://github.com/katearb/files/raw/main/titanic_train.csv

df = pd.read_csv('./titanic_train.csv')

df

df.info();

df.shape # Mostra linhas e colunas

df.head()

from sklearn.impute import KNNImputer
from sklearn.preprocessing import FunctionTransformer, OneHotEncoder, MinMaxScaler
from sklearn.compose import ColumnTransformer

df.index = df['PassengerId']

df

df.isnull().sum()

df['Age_known'] = ~df['Age'].isnull()
df['Cabin_known'] = ~df['Cabin'].isnull()

df.drop(['Cabin', 'Name', 'Ticket', 'Embarked'], inplace=True, axis=1)

#Transformando male em 1 e female em 0
sex_map_dict = {'male': 1,
           'female': 0}

df['Sex'] = df['Sex'].map(sex_map_dict)

df

df = pd.DataFrame(KNNImputer().fit_transform(df), columns=df.columns)

#Remoção de coluna Survived
X = df.drop('Survived', axis=1)
y = df['Survived']

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y,
                                                    stratify=y,
                                                    test_size=0.33,
                                                    shuffle=True)

from sklearn.base import BaseEstimator
import numpy as np

from sklearn.metrics import classification_report

import random
random.seed(0)