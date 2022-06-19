# Càrrega dels mòduls necessaris per al bon funcionament de l'eina
from gensim.models.doc2vec import Doc2Vec, TaggedDocument
import os
# Declaració de la ruta on son els arxius .third
dir = './third/'
# Declaració de les estructures de dades on es bolcaràn els noms i contingut dels arxius .third
tags = list()
data = list()
# Per a cada arxiu .third, s'incorpora el seu nom a l'estructura "tags" i el seu contingut a l'estructura "data"
for file in os.listdir(dir):
    webpage = os.path.splitext(file)[0]
    tags.append(webpage)
    f = os.open("./third/"+webpage+".third", os.O_RDONLY)
    aux = os.read(f, os.path.getsize(f))
    aux = str(aux, 'utf-8')
    os.close(f)
    data.append(aux)
# A partir de les estructures "tags" i "data", es crea una estructura "tagged_data" que conté un TaggedDocument per arxiu .third
tagged_data = []
for i in enumerate(data):
    aux = list()
    aux.append(tags[i[0]])
    tagged_data.append(TaggedDocument(words=data[i[0]].split(), tags=aux))
# Es defineixen els valors del model Doc2Vec
model = Doc2Vec(vector_size=200,
                alpha=0.065,
                min_alpha=0.00025,
                min_count=0,
                dm = 0,
                window=2,
                epochs=250,
                workers=5)
# S'entrena el model Doc2Vec prèviament creat
model.build_vocab(tagged_data)
model.train(tagged_data,
                total_examples=model.corpus_count,
                epochs=250)
# Es guarda el model Doc2Vec a disc
model.save("model.doc2vec")