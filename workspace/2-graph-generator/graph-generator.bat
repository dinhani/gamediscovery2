echo "DataFrame Joiner"
cd 2.1-dataframe-joiner
Rscript dataframe-joiner.r

echo "DataFrame Text Processor"
cd ..
cd 2.2-dataframe-text-processor
Rscript dataframe-text-processor.r

echo "DataFrame Renamer"
cd ..
cd 2.3-dataframe-renamer
Rscript dataframe-renamer.r

echo "DataFrame Enhancer"
cd ..
cd 2.4-dataframe-enhancer
Rscript dataframe-enhancer.r

echo "DataFrame Discarder"
cd ..
cd 2.5-dataframe-discarder
Rscript dataframe-discarder.r

echo "DataFrame To Graph"
cd ..
cd 2.6-dataframe-to-graph
Rscript dataframe-to-graph.r
