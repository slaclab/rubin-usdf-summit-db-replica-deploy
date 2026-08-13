#!/usr/bin/env bash
cd "$(dirname "$0")"
./src.sh; ./tgt.sh; grep -v 'You are now' src.out >src.out.1;grep -v 'You are now' tgt.out >tgt.out.1; diff src.out.1 tgt.out.1 |grep -v -- ---|egrep -v -- '^[0-9]'
