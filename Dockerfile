FROM continuumio/anaconda3
RUN /opt/conda/bin/conda install -y --quiet jupyter && mkdir /opt/notebooks
# 機械学習
RUN apt update && apt install -y gcc g++ swig mecab libmecab-dev mecab-ipadic-utf8 \
 && /opt/conda/bin/conda install -y --quiet nltk \
    # 本当は Anaconda 仮想環境の外で pip を使うのは良くないが、とりあえず動いたらよしとする
 && pip install PyHamcrest \
 && pip install --upgrade pip \
 && pip install mecab-python3
EXPOSE 8888
CMD ["bash", "-c", "/opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"]
