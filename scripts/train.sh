#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/grimm \
        --epochs 40 \
        --log-interval 100 \
<<<<<<< HEAD
        --emsize 250 --nhid 250 --dropout 0.9 --tied \
=======
        --emsize 200 --nhid 200 --dropout 0.5 --tied \
>>>>>>> 20b39ffaf839aaf6fec9d17c94ec1d6346699267
        --save $models/model.pt
)

echo "time taken:"
echo "$SECONDS seconds"
