FROM jenkins/jenkins:2.349-alpine

RUN jenkins-plugin-cli --verbose --latest true --clean-download-directory --plugins \
       kubernetes:3580.v78271e5631dc \
       workflow-aggregator:2.7 \
       git:4.11.1 \
       configuration-as-code:1429.v09b_044a_c93de \
       authorize-project:1.4.0 \
       blueocean-bitbucket-pipeline:1.25.5 \
       cloudbees-bitbucket-branch-source:773.v4b_9b_005b_562b_ \
       blueocean:1.25.5 \
       role-strategy:484.v8a_a_e4b_d785fd \
       prometheus:2.0.11 \
       aws-secrets-manager-credentials-provider:1.1.0 \
       cloudbees-disk-usage-simple:0.10 \
       strict-crumb-issuer:2.1.0 \
       saml:2.297.v1a_dff8e51f90 \
       ws-cleanup:0.42 \
       htmlpublisher:1.30 \
       code-coverage-api:2.0.4 \
       slack:608.v19e3b_44b_b_9ff \
       ssh-agent:295.v9ca_a_1c7cc3a_a_ \
       ansicolor:1.0.1 \
       build-discarder:60.v1747b0eb632a \
       jaxb:2.3.6-1 \
       command-launcher:84.v4a_97f2027398 \
       jdk-tool:1.5 \
       popper-api:1.16.1-3 \
       uno-choice:2.6.1