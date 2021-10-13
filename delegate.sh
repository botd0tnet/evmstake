#!/bin/bash


WALLET="BotDotNet"
CHAINID="evmos_9000-1"
RATE="aphoton"
#ADD_WALLET=$(umeed keys show $WALLET --address)
ADD_WALLET=evmos1hesk5hkzmx3fgehydqqx4nfc6j8jakk53p56ks

#sleep 2

#VAL_WALLET=$(umeed keys show $WALLET --bech val --address)
VAL_WALLET=evmosvaloper1hesk5hkzmx3fgehydqqx4nfc6j8jakk5u0m2hd

sleep 2



evmosd tx distribution withdraw-rewards $VAL_WALLET --commission --yes --gas auto --fees 2000aphoton --from $WALLET --chain-id evmos_9000-1 -y

sleep 10

BALANCE=$(evmosd query bank balances $ADD_WALLET | grep "amount" | cut -d'"' -f 2)
BALANCE=$(echo $BALANCE | cut -d' ' -f 2)
BALANCE=$((BALANCE - 5000000))

sleep 2

printf "%b\n\n\n" "--------------------------------------------------------------------------------"

evmosd tx staking delegate $VAL_WALLET $BALANCE${RATE} --gas auto --fees 2000aphoton --from $WALLET --chain-id evmos_9000-1 -y

sleep 1200
