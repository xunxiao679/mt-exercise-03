import pandas as pd
import matplotlib.pyplot as plt

data_val = pd.read_csv('validation_ppl.csv')
plt.plot(data_val,label=list(data_val.columns))
plt.legend()
plt.savefig('validation.png')