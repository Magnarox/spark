# Spark

## Objective

Build and test Spark 2.4.4 distrib with :

* Scala 2.11
* Hadoop 3.1.2
* Python 3.7.1
* R 3.3.3
* Kubernetes
* ElasticSearch 6.8.1

## Build distrib

### Create your building docker image

Run 

    cd build-distrib
    docker-builder.sh

### Create distrib

Launch docker container and build distrib : 

    docker run -it -v <spark_repo>/build-distrib/out:/spark/out/ spark-builder /bin/bash
    > ./build-distrib.sh

After a long time, distrib named `spark-2.4.4-bin-magnarox-spark.tgz` is in `<spark_repo>/build-distrib/out` directory.

### Add custom jars

    cd <spark_repo>/build-distrib/out
    chmod 755 spark-2.4.4-bin-magnarox-spark.tgz
    tar xvf spark-2.4.4-bin-magnarox-spark.tgz
    rm spark-2.4.4-bin-magnarox-spark.tgz
    cp <spark_repo>/custom-jars/*.jar spark-2.4.4-bin-magnarox-spark/jars/
    tar -cvzf spark-2.4.4-bin-magnarox-spark.tgz ./spark-2.4.4-bin-magnarox-spark

Your distrib is Ready

## Prepare docker images for spark

Get the distrib and untar it then build images :

    tar xvf spark-2.4.4-bin-magnarox-spark.tgz
    cd spark-2.4.4-bin-magnarox-spark
    ./bin/docker-image-tool.sh -r magnarox -t latest build
    ./bin/docker-image-tool.sh -r magnarox -t latest push



