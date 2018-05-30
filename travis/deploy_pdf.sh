#!/bin/bash

set -e

if [[ "${TRAVIS_OS_NAME}" == "linux" && "${TRAVIS_BRANCH}" == "master" && "${TRAVIS_PULL_REQUEST}" == "false" ]]; then
  echo -e "Host github.com\n\tStrictHostKeyChecking no\nIdentityFile ~/.ssh/deploy.key\n" >> ~/.ssh/config
  openssl aes-256-cbc -k "$SERVER_KEY" -in ./travis/deploy_key.enc -d -a -out deploy.key
  cp deploy.key ~/.ssh/
  chmod 600 ~/.ssh/deploy.key
  git config --global user.email "mizukota@gmail.com"
  git config --global user.name "Kota Mizushima"
  git fetch origin gh-pages:gh-pages
  sudo git stash -u
  sudo git checkout gh-pages
  sudo rm scala_text.pdf
  sudo git stash pop
  sudo git add scala_text.pdf
  sudo git commit -a -m "auto commit on travis $TRAVIS_JOB_NUMBER $TRAVIS_COMMIT"
  git push git@github.com:dwango/scala_text_pdf.git gh-pages:gh-pages
fi
