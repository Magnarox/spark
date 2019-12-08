#!/bin/bash

cd /spark/

chown -R root:root out/
chmod -R 755 out/

cd /spark/spark-2.4.4/

export MAVEN_OPTS="-Xmx2g -XX:ReservedCodeCacheSize=512m"
./dev/make-distribution.sh --name magnarox-spark --pip --r --tgz -Psparkr -Phadoop-3.1 -Dhadoop.version=3.1.2 -Phive -Phive-thriftserver -Pkubernetes

cp *.tgz ../out/

cd ../out/
tar xvf spark-2.4.4-bin-magnarox-spark.tgz
cp -R ../spark-2.4.4/licenses/ spark-2.4.4-bin-magnarox-spark/
cp custom-jars/*.jar spark-2.4.4-bin-magnarox-spark/jars/
rm spark-2.4.4-bin-magnarox-spark.tgz
tar czf spark-2.4.4-bin-magnarox-spark.tgz spark-2.4.4-bin-magnarox-spark
