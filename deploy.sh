#!/bin/bash
server=personal@efanov.me
client_path=/home/personal/automation-sync-game-experiment

ssh $server "ssh-agent bash --login -c 'source ~/.nvm/nvm.sh && nvm use stable && cd $client_path && git pull && npm install && npm run build'"