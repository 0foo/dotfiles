#!/bin/bash

LABKEY_HOME=/labkey/labkey/release20.7-SNAPSHOT

function mutant-labkey-run-tests {
  cd $LABKEY_HOME
  ./gradlew :server:test:uiTest -Ptest=TNPRC_RequestsTest.testColonyManagementRequest -Pclean=false -Pselenium.browser=firefox
}


function mutant-labkey-build-tnprc {
  cd $LABKEY_HOME
  ./gradlew :server:modules:tnprc_ehr:deployModule --stacktrace
}

echo "Labkey Module Loaded"