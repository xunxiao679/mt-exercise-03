#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $data/grimm

mkdir -p $data/grimm/raw

<<<<<<< HEAD
## wget https://www.gutenberg.org/files/52521/52521-0.txt
## mv 52521-0.txt $data/grimm/raw/tales.txt

wget https://www.gutenberg.org/cache/epub/98/pg98.txt
mv pg98.txt $data/grimm/raw/historical_fiction.txt

# preprocess slightly

## cat $data/grimm/raw/tales.txt | python $base/scripts/preprocess_raw.py > $data/grimm/raw/tales.cleaned.txt
cat $data/grimm/raw/historical_fiction.txt | python $base/scripts/preprocess_raw.py > $data/grimm/raw/historical_fiction.cleaned.txt

# tokenize, fix vocabulary upper bound

## cat $data/grimm/raw/tales.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
##     $data/grimm/raw/tales.preprocessed.txt
cat $data/grimm/raw/historical_fiction.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
    $data/grimm/raw/historical_fiction.preprocessed.txt

# split into train, valid and test

## head -n 440 $data/grimm/raw/tales.preprocessed.txt | tail -n 400 > $data/grimm/valid.txt
## head -n 840 $data/grimm/raw/tales.preprocessed.txt | tail -n 400 > $data/grimm/test.txt
## tail -n 3075 $data/grimm/raw/tales.preprocessed.txt | head -n 2955 > $data/grimm/train.txt


head -n 440 $data/grimm/raw/historical_fiction.preprocessed.txt | tail -n 400 > $data/grimm/valid.txt
head -n 840 $data/grimm/raw/historical_fiction.preprocessed.txt | tail -n 400 > $data/grimm/test.txt
tail -n 3075 $data/grimm/raw/historical_fiction.preprocessed.txt | head -n 2955 > $data/grimm/train.txt
=======
wget https://www.gutenberg.org/files/52521/52521-0.txt
mv 52521-0.txt $data/grimm/raw/tales.txt

# preprocess slightly

cat $data/grimm/raw/tales.txt | python $base/scripts/preprocess_raw.py > $data/grimm/raw/tales.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/grimm/raw/tales.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
    $data/grimm/raw/tales.preprocessed.txt

# split into train, valid and test

head -n 440 $data/grimm/raw/tales.preprocessed.txt | tail -n 400 > $data/grimm/valid.txt
head -n 840 $data/grimm/raw/tales.preprocessed.txt | tail -n 400 > $data/grimm/test.txt
tail -n 3075 $data/grimm/raw/tales.preprocessed.txt | head -n 2955 > $data/grimm/train.txt
>>>>>>> 20b39ffaf839aaf6fec9d17c94ec1d6346699267
