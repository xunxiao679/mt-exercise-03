# MT Exercise 3: Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model). Thanks to Emma van den Bold, the original author of these scripts. 

# Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

# Steps

Clone this repository in the desired place:

    git clone https://github.com/moritz-steiner/mt-exercise-03
    cd mt-exercise-03

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing the `source` command that is output by the shell script above.

Download and install required software:

    ./scripts/install_packages.sh

Download and preprocess data:

    ./scripts/download_data.sh

Train a model:

    ./scripts/train.sh

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh

# Task 1: Changes in ./scripts/download_data.sh
1. Modify the link to the interested data:
	`wget https://www.gutenberg.org/cache/epub/98/pg98.txt`
	`mv pg98.txt $data/grimm/raw/historical_fiction.txt`
2. Modify filename(from "tales" to "historical_fiction" ) to preprocess, tokenize, and split it into train/valid/test data:
	1) cat $data/grimm/raw/historical_fiction.txt | python $base/scripts/preprocess_raw.py > `$data/grimm/raw/historical_fiction.cleaned.txt`

	2) cat $data/grimm/raw/historical_fiction.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
  		`$data/grimm/raw/historical_fiction.preprocessed.txt`
  	
  	3) head -n 440 $data/grimm/raw/historical_fiction.preprocessed.txt | tail -n 400 > $data/grimm/valid.txt
	   head -n 840 $data/grimm/raw/historical_fiction.preprocessed.txt | tail -n 400 > $data/grimm/test.txt
	   tail -n 3075 $data/grimm/raw/historical_fiction.preprocessed.txt | head -n 2955 > $data/grimm/train.txt

# Task 2
# Reproduction of data
Copy the files from the solution folder to `tools/pytorch-examples/word_language_model/data/wikitext-2`

Run the `train.sh` in the scripts folder with different dropout rates to get the data.

Run the `plot_training.py` and `plot_validation.py` to get the plots.
