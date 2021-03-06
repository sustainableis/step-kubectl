#!/bin/bash

kubectl_command=$WERCKER_KUBECTL_COMMAND
insecure_verify="false"

if [ "$WERCKER_KUBECTL_INSECURE_SKIP_TLS_VERIFY" = "true" ] ; then
  insecure_verify="true"
fi

if [ -n "$WERCKER_KUBECTL_IMAGE" ] ; then
  kubectl_command="$kubectl_command --image=$WERCKER_KUBECTL_IMAGE"
fi

chmod +x $WERCKER_STEP_ROOT/kubectl

$WERCKER_STEP_ROOT/kubectl $kubectl_command --server=$WERCKER_KUBECTL_SERVER --token=$WERCKER_KUBECTL_TOKEN --insecure-skip-tls-verify=$insecure_verify
