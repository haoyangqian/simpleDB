#!/bin/bash
cd ~/
wget http://www.cs.bc.edu/~sciore/simpledb/SimpleDB_2.10.zip
unzip SimpleDB_2.10.zip
echo export CLASSPATH=.:~/SimpleDB_2.10:$CLASSPATH >> ~/.bashrc
source ~/.bashrc
cd SimpleDB_2.10
javac simpledb/server/Startup.java
javac studentClient/simpledb/CreateStudentDB.java
javac studentClient/simpledb/StudentMajor.java
java simpledb.server.Startup student &
sleep 5
cd studentClient/simpledb
java CreateStudentDB
java StudentMajor
pkill -9 java
