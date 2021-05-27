#!/bin/bash


function mutant-labkey-run-tests {
  cd $LABKEY_REPO
  ./gradlew :server:test:uiTest -Ptest=TNPRC_RequestsTest.testColonyManagementRequest -Pclean=false -Pselenium.browser=firefox
}


function mutant-labkey-build-tnprc {
  cd $LABKEY_REPO
  ./gradlew :server:modules:tnprc_ehr:deployModule --stacktrace
}

echo "Labkey Module Loaded"
