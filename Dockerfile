FROM flokkr/spark

ENV SPARK_HOME /opt/spark
ENV PYSPARK_PYTHON python3

ENV LIVY_VERSION 0.5.0-incubating
ENV LIVY_HOME /opt/livy

RUN wget -O livy.zip https://www-us.apache.org/dist/incubator/livy/$LIVY_VERSION/livy-$LIVY_VERSION-bin.zip && \
    unzip -qq livy.zip -d /opt && \
    rm livy.zip && \
    mv ${LIVY_HOME}* $LIVY_HOME && \
    mkdir -p ${LIVY_HOME}/logs && \
    apk add --no-cache python3

ADD conf/* ${LIVY_HOME}/conf/

CMD ["/opt/livy/bin/livy-server"]