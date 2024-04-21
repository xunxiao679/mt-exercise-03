import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv('training_ppl.csv')
plt.plot(data,label=list(data.columns))
plt.legend()
plt.savefig('training.png')

